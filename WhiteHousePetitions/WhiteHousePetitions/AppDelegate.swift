//
//  AppDelegate.swift
//  WhiteHousePetitions
//
//  Created by Jose Melendez on 8/23/17.
//  Copyright © 2017 JoseMelendez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let tabBarController = window?.rootViewController as? UITabBarController {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let vc = storyboard.instantiateViewController(withIdentifier: "NavController")
            
            vc.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
            
            tabBarController.viewControllers?.append(vc)
        }
        
        return true
        
        
    }

}

