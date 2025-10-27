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
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
        
}

extension  QuickCab2MapViewRepresantable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent : QuickCab2MapViewRepresantable
        
        init(parent: QuickCab2MapViewRepresantable) {
            self.parent = parent
            super.init()
        }
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            parent.mapView.setRegion(region, animated: true)
            
        }
        
    }
    
    
}
