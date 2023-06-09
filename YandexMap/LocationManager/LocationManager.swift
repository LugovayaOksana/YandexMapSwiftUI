//
//  LocationManager.swift
//  YandexMap
//
//  Created by Oksana on 22.05.2023.
//

import Foundation
import CoreLocation
import YandexMapsMobile
import Combine


class LocationManager: NSObject, ObservableObject {
    let INITIAL_LOCATION = YMKPoint(latitude: 55.7558, longitude: 37.6173)
    private let manager = CLLocationManager()
    @Published var lastUserLocation: CLLocation? = nil
    @Published var authorizationStatus: CLAuthorizationStatus = CLAuthorizationStatus.notDetermined
    @Published var showAlert: Bool = false
    
    static let shared = LocationManager()
    
    lazy var map : YMKMap = {
        return mapView.mapWindow.map
    }()
    
    let mapView = YMKMapView(frame: CGRect.zero)
    
    override init(){
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        getAuthorizationStatus()
        centerMapLocation(target: INITIAL_LOCATION, map: mapView, zoom: 10)
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
    
    private func getAuthorizationStatus() {
        let status = manager.authorizationStatus
        print("lm => authorizationStatus: \(status.self)")
        if status != CLAuthorizationStatus.authorizedWhenInUse {
            showAlert = true
        }
    }
    
    func centerMapLocation(target location: YMKPoint?, map: YMKMapView, zoom: Float) {
        guard let location = location else { print("Failed to get user location"); return }
        map.mapWindow.map.move(
            with: YMKCameraPosition(target: location, zoom: zoom, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 0.5),
            cameraCallback: nil
        )
    }
    
    func currentUserLocation(){
        if let myLocation = lastUserLocation {
            centerMapLocation(
                target: YMKPoint(
                    latitude: myLocation.coordinate.latitude,
                    longitude: myLocation.coordinate.longitude),
                map: mapView,
                zoom: 18
            )
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    // Notify listeners that the user has a new location
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            print("Debug: not determined")
            authorizationStatus = .notDetermined
        case .restricted:
            print("Debug: restricted")
            authorizationStatus = .restricted
        case .denied:
            print("Debug: denied...")
            authorizationStatus = .denied
        case .authorizedAlways:
            print("Debug: authorizedAlways")
            authorizationStatus = .authorizedAlways
        case .authorizedWhenInUse:
            print("Debug: authorizedWhenInUse")
            authorizationStatus  = .authorizedWhenInUse
            self.manager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.lastUserLocation = location
    }
}
