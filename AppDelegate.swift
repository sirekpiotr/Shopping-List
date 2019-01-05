//
//  AppDelegate.swift
//  Shopping List
//
//  Created by Piotr Sirek on 01/01/2019.
//  Copyright © 2019 Piotr Sirek. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainTabBarViewController = MainTabBarViewController()
        let shoppingNavigationViewController = ShoppingNavigationViewController()
        let settingsNavigationViewController = SettingsNavigationViewController()
        let shoppingViewController = ShoppingViewController()
        let settingsViewController = SettingsViewController()
        
        shoppingNavigationViewController.title = "Shopping List"
        settingsNavigationViewController.title = "Settings"
        
        mainTabBarViewController.viewControllers = [shoppingNavigationViewController, settingsNavigationViewController]
        
        shoppingNavigationViewController.viewControllers = [shoppingViewController]
        settingsNavigationViewController.viewControllers = [settingsViewController]
        
        window!.rootViewController = mainTabBarViewController
        window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

