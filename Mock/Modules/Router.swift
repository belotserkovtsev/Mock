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
}

final class Router: RouterProtocol {
	private weak var window: UIWindow?
    
	private let assembly: AssemblyProtocol

	init(assembly: AssemblyProtocol, window: UIWindow?) {
		self.window = window
		self.assembly = assembly
	}

	func decideWhatModuleToShowFirst() {
        let vc = assembly.assembleLaunchModule(output: self)

		self.window?.rootViewController = vc
		self.window?.makeKeyAndVisible()
    }
}
