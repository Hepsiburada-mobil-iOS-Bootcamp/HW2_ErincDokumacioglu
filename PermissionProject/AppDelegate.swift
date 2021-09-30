//
//  AppDelegate.swift
//  PermissionProject
//
//  Created by Erinç Olkan Dokumacıoğlu on 27.09.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = MainViewBuilder.build()
        let navigationViewController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

