//
//  AppDelegate.swift
//  Algo
//
//  Created by cxz on 2020/3/5.
//  Copyright © 2020 cxz. All rights reserved.
//

import UIKit

class Object: NSObject {
    var view: UIView?
    var count: Int = 10
    init(_ v: UIView?) {
        self.view = v
        super.init()
    }
}

struct kStruct {
    var view: UIView?
    init(_ v: UIView?) {
        self.view = v
    }
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        
        var l1 = ListNode.generateTestData([1,2,3,4])
        
        var l3 = Solution3.swapPairs(l1)
        l3?.logListNode()
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

