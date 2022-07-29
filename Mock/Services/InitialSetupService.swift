//
//  InitialSetupService.swift
//  Mock
//
//  Created by b.belotserkovtsev on 25.07.2022.
//

import Swinject

protocol InitialSetupServiceProtocol {
	func buildAndPresentInitialController(in window: UIWindow?)
}

final class InitialSetupService: InitialSetupServiceProtocol {
	private func buildDependencyContainer() -> Container {
		let container = Container()

		container.register(AssemblyProtocol.self) { _ in
			Assembly()
		}.inObjectScope(.weak)

        container.register(NetworkServiceProtocol.self) { _ in
            NetworkService()
        }.inObjectScope(.weak)

		return container
	}

	func buildAndPresentInitialController(in window: UIWindow?) {
		let container = buildDependencyContainer()
		let router = Router(container: container, window: window)
		router.decideWhatModuleToShowFirst()
	}
}
