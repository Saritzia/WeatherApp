//
//  LocationDataManager.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 6/8/23.
//

import Foundation
import CoreLocation

final class LocationDataManager : NSObject, ObservableObject{
    //MARK: -Properties
    private let locationManager : CLLocationManager
    @Published var location: CLLocationCoordinate2D?
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    //MARK: -Methods
    func requestLocation() {
        locationManager.requestLocation()
        location = locationManager.location?.coordinate
    }
}
//MARK: -CLLocation manager methods
extension LocationDataManager : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
}
