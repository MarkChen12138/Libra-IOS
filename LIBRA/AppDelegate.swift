//
//  AppDelegate.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/9/20.
//

import UIKit
import FirebaseCore
import FirebaseStorage

class AppDelegate: UIResponder, UIApplicationDelegate {

    override init() {
        super.init()
        // disable app delegate swizzling
        UIApplication.shared.delegate = nil
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 配置 FirebaseApp 共享实例
        FirebaseApp.configure()
        return true
    }

    // ...

}
