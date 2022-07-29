//
//  AppDelegate.swift
//  Quipy
//
//  Created by k.lukyanov on 02.04.2022.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

		window = UIWindow()
        let initialSetupService = InitialSetupService()
        initialSetupService.buildAndPresentInitialController(in: window)
		
		return true
	}
	
	func application(
        _ application: UIApplication, open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any]
    ) -> Bool { return true }
}

