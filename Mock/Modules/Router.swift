//
//  Router.swift
//  Mock
//
//  Created by b.belotserkovtsev on 25.07.2022.
//

import UIKit
import Swinject

protocol RouterProtocol: AnyObject {
	func decideWhatModuleToShowFirst()
    func customTransitionScreen()
}

final class Router: RouterProtocol {
	private weak var window: UIWindow?
    private let navigation = UINavigationController()
    
	private let assembly: AssemblyProtocol

	init(assembly: AssemblyProtocol, window: UIWindow?) {
		self.window = window
		self.assembly = assembly
	}

	func decideWhatModuleToShowFirst() {
        let vc = assembly.assembleLaunchModule(output: self)
		window?.rootViewController = navigation
        window?.makeKeyAndVisible()

        navigation.pushViewController(vc, animated: false)
    }

    func customTransitionScreen() {
        let vc = assembly.assembleTransitionModule()
        navigation.present(vc, animated: true)
    }
}
