//
//  AppDelegate.swift
//  YandexMap
//
//  Created by Oksana on 22.05.2023.
//

import Foundation
import UIKit
import YandexMapsMobile

class AppDelegate: NSObject, UIApplicationDelegate {
    
    let MAPKIT_API_KEY = "key"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("App Did Launch!")
        YMKMapKit.setApiKey(MAPKIT_API_KEY)
        YMKMapKit.sharedInstance()
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
          let sceneConfig: UISceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
          sceneConfig.delegateClass = SceneDelegate.self
          return sceneConfig
      }
}
