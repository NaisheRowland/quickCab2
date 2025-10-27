//
//  LocationsManager.swift
//  QuickCab2
//
//  Created by Naishe Rowland  on 10/27/25.
//
import CoreLocation

class LocationsManager: NSObject, ObservableObject{
    
    private let locationManager = CLLocationManager()
    
    override init() {
       locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.stopUpdatingLocation()
    }
    
}

extension LocationsManager : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard !locations.isEmpty else{return}
        locationManager.startUpdatingLocation()
    }
}
