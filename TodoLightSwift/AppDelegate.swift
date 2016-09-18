//
//  AppDelegate.swift
//  TodoLightSwift
//
//  Created by Max Rozdobudko on 9/17/16.
//  Copyright © 2016 Max Rozdobudko. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, LoginViewControllerDelegate
{
    // MARK: Properties
    
    var window: UIWindow?
    
    var currentUserId:String?
    {
        set {
            UserDefaults.standard.set(newValue, forKey: "user_id")
        }
        get {
            return UserDefaults.standard.object(forKey: "user_id") as? String
        }
    }
    
    var loginViewController:LoginViewController!

    // MARK: UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions);
        
        self.loginViewController = self.window?.rootViewController as! LoginViewController
        self.loginViewController.delegate = self
        
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool
    {
        let handled = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        
        return handled;
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: LoginViewControllerDelegate
    
    func didLoginAsGuest()
    {
        
    }
    
    func didLoginWithFacebookUser(userId:String, name:String, token:String)
    {
        
    }
    
    func didLogout()
    {
        
    }

    // MARK: Alerts

    func showMessage(message:String, withTitle title:String)
    {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.window?.rootViewController?.present(controller, animated: true, completion: nil)
    }
}

