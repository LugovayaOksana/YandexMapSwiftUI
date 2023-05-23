//
//  YandexMapApp.swift
//  YandexMap
//
//  Created by Oksana on 22.05.2023.
//

import SwiftUI

@main
struct YandexMapApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MapView()
        }
    }
}
