//
//  AppDelegate.swift
//  Swapi
//
//  Created by Florian Albrecht on 28.09.16.
//  Copyright © 2016 Florian Albrecht. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        let filmsViewController = FilmsViewController()

        let navigationController = UINavigationController(rootViewController: filmsViewController)
        navigationController.navigationBar.barTintColor = UIColor.black
        navigationController.navigationBar.tintColor = UIColor.white
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationController.navigationBar.isTranslucent = false

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

