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
    
    func makeUIView(context: Context) -> some UIView {
        
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
        
    }
    
    
}
