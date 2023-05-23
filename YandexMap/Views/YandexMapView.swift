//
//  YandexMapView.swift
//  YandexMap
//
//  Created by Oksana on 22.05.2023.
//

import SwiftUI
import YandexMapsMobile
import Combine

struct YandexMapView: UIViewRepresentable {
    @EnvironmentObject var locationManager : LocationManager
    func makeUIView(context: Context) -> YMKMapView {
        return locationManager.mapView
    }
    func updateUIView(_ mapView: YMKMapView, context: Context) {}
}
