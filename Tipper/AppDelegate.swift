//
//  AppDelegate.swift
//  Tipper
//
//  Created by Nag Varun Chunduru on 8/24/14.
//  Copyright (c) 2014 cnv. All rights reserved.
//

import UIKit

class TipsControl {
    var itSucked: Double {
        didSet {
            println("isSucked did got set.")
        }
    }
    var itWasOk:Double {
        didSet {
            println("itWasOk dit got set.")
        }
    }
    var itWasAmazing:Double {
        didSet {
            println("itWasAmazing did got set.")
        }
    }
    init(itSucked: Double = 0.18, itWasOk: Double = 0.2, itWasAmazing: Double = 0.22) {
        self.itSucked = itSucked
        self.itWasOk = itWasOk
        self.itWasAmazing = itWasAmazing
        self.load()
    }
    func getString() -> String {
        return String(format: "%.2f,%.2f,%.2f", arguments: [self.itSucked, self.itWasOk, itWasAmazing])
    }
    func save () {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(self.getString(), forKey: "tipper_app_tips")
        defaults.synchronize()
    }
    func load () {
        var defaults = NSUserDefaults.standardUserDefaults()
        if var tipperTipsOb = defaults.objectForKey("tipper_app_tips") as? String {
            var stringValue = tipperTipsOb
            var tipsArray = stringValue.componentsSeparatedByString(",")
            self.itSucked = NSString(string: tipsArray[0]).doubleValue
            self.itWasOk = NSString(string: tipsArray[1]).doubleValue
            self.itWasAmazing = NSString(string: tipsArray[2]).doubleValue
        }
    }
}

var tipsControl = TipsControl()


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication!) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication!) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        tipsControl.save()
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        tipsControl.load()
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        tipsControl.load()
    }

    func applicationWillTerminate(application: UIApplication!) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        tipsControl.save()
    }


}

