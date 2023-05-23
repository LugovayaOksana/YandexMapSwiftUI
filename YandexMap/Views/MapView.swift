//
//  MapView.swift
//  YandexMap
//
//  Created by Oksana on 22.05.2023.
//

import SwiftUI

struct MapView: View {
    @ObservedObject var locationManager = LocationManager.shared
    @State var showAlert: Bool =  false
    
    var body: some View {
        ZStack{
            YandexMapView()
                .edgesIgnoringSafeArea(.all)
                .environmentObject(locationManager)
            if showAlert {
                Color.overlay.ignoresSafeArea(.all)
                    .zIndex(1)
                dialogContent
            }
        }
        .onAppear{
            if locationManager.lastUserLocation == nil {
                locationManager.requestLocation()
            } else {
                locationManager.currentUserLocation()
            }
            if locationManager.authorizationStatus == .restricted ||  locationManager.authorizationStatus == .denied {
                showAlert = true
            }
        }
    }
    
    private var dialogContent: some View {
        DialogView(onClick: {
            withAnimation(.spring()) {
                showAlert = false
            }
        })
        .transition(.move(edge: .top).combined(with: .opacity))
        .overlay(
            Button(action: {
                withAnimation(.spring()) {
                    showAlert = false }
            }) {
                Image(systemName: "xmark")
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color.black)
            }
                .frame(width: 22)
                .padding(30),
            alignment: .topTrailing
        )
        .zIndex(1)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
