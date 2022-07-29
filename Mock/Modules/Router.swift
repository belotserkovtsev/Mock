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

	private let container: Container
	private let assembly: AssemblyProtocol

	init(container: Container, window: UIWindow?) {
		self.container = container
		self.window = window
		self.assembly = container.resolve()
	}

	func decideWhatModuleToShowFirst() {
		self.window?.rootViewController = LaunchViewController()
		self.window?.makeKeyAndVisible()
    }
}
