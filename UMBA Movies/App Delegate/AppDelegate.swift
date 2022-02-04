//
//  AppDelegate.swift
//  Autocheck Partner
//
//  Created by Isaac Iniongun on 29/12/2021.
//

import UIKit
import SDWebImage
import SDWebImageSVGKitPlugin
import RealmSwift
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    static let dependencyContainer: Container = {
        let container = Container()
        DependencyContainer.configure(using: container)
        return container
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let SVGCoder = SDImageSVGKCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        
        setupTabbarController()
        
        runRealmMigrations()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: AppDelegate.dependencyContainer.moviesController)
        window?.makeKeyAndVisible()
        
        return true
    }

    private func setupTabbarController() {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = UIColor("#26376D")
    }
    
    private func setupNavigationController() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.primaryTextColor]
        UINavigationBar.appearance().tintColor = .primaryTextColor
        UINavigationBar.appearance().layer.shadowColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.09).cgColor
        UINavigationBar.appearance().layer.shadowOffset = CGSize(width: 0.0, height: 5)
        UINavigationBar.appearance().layer.shadowRadius = 5.0
        UINavigationBar.appearance().layer.shadowOpacity = 0.5
        UINavigationBar.appearance().layer.masksToBounds = false
    }
    
    fileprivate func runRealmMigrations() {
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 1,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 0) {
                    
                }
            })
        
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
    }
}

