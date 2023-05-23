//
//  MapView.swift
//  YandexMap
//
//  Created by Oksana on 22.05.2023.
//

import SwiftUI

struct MapView: View {
    @ObservedObject var locationManager = LocationManager.shared
    
    var body: some View {
        ZStack{
            YandexMapView()
                .edgesIgnoringSafeArea(.all)
                .environmentObject(locationManager)
        }
        .onAppear{
            print("onAppear MapView")
            if locationManager.lastUserLocation == nil {
                print("lastUserLocation == nil")
                locationManager.requestLocation()
            } else {
                locationManager.currentUserLocation()
            }
            locationManager.getAuthorizationStatus()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
