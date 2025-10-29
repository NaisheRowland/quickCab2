//
//  QuickCabMapViewRepresantable.swift
//  QuickCab2
//
//  Created by Naishe Rowland  on 10/27/25.
//

import SwiftUI
import MapKit


struct  QuickCab2MapViewRepresantable: UIViewRepresentable {
   
    
    let mapView = MKMapView()
    let locationManager = LocationsManager()
    @EnvironmentObject var locationViewModel : LocationSearchViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let coordinate = locationViewModel.selectedLocationCoordinate{
            context.coordinator.addandSelectAnnotation(coordinate: coordinate)
            context.coordinator.configurePolyLine(withDestinationCoordinate: coordinate)
            print("Naishe selected coordinate the map view is \(coordinate)")
        }
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
        
}

extension  QuickCab2MapViewRepresantable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent : QuickCab2MapViewRepresantable
        var userLocationCoordinate : CLLocationCoordinate2D?
        
        init(parent: QuickCab2MapViewRepresantable) {
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            parent.mapView.setRegion(region, animated: true)
            
        }
        
        // MARK: Helpers
        
        func addandSelectAnnotation(coordinate: CLLocationCoordinate2D) {
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            parent.mapView.addAnnotation(annotation)
            parent.mapView.selectAnnotation(annotation, animated: true)
            
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
        }
        
        func configurePolyLine(withDestinationCoordinate coordinate : CLLocationCoordinate2D){
            guard let userLocationCoordinate = self.userLocationCoordinate else {return}
                    
            getDestinationRoute(from: userLocationCoordinate,
                                to: coordinate) { route in
           
                self.parent.mapView.addOverlay(route.polyline)
                
                
            }
        }
        
        func getDestinationRoute(from userLocation : CLLocationCoordinate2D, to destination : CLLocationCoordinate2D, completion: @escaping (MKRoute) -> Void){
            
            let userPlacemark  = MKPlacemark(coordinate: userLocation)
            let destPlacemark = MKPlacemark(coordinate: destination)
            let request = MKDirections.Request()
            
            request.source = MKMapItem(placemark: userPlacemark)
            request.destination = MKMapItem(placemark: destPlacemark)
            let direction = MKDirections(request: request)
            
            
            direction.calculate { response, error in
                if let error = error {
                    print("DEBUG: failed to get directions with \(error.localizedDescription)")
                    return
                }
              
                guard let route = response?.routes.first else {return}
                completion(route)
                
            }
//
       }
        
        
        func mapView(_ mapView: MKMapView, rendererFor overlay:  MKOverlay) -> MKOverlayRenderer {
            let polyLine = MKPolylineRenderer(overlay: overlay)
            polyLine.strokeColor = .systemBlue
            polyLine.lineWidth = 6
            return polyLine
        }
    }
    
    
}
