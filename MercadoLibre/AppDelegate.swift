//
//  AppDelegate.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var meLiCoordinator: MeLiCoordinator?
    let navController = UINavigationController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeWindow()
        return true
    }
    
    func initializeWindow() {
        meLiCoordinator = MeLiCoordinator(navigationController: navController)
        meLiCoordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

