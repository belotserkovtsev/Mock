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
			Assembly(container: container)
		}.inObjectScope(.weak)

        container.register(NetworkServiceProtocol.self) { _ in
            NetworkService()
        }.inObjectScope(.weak)

        container.register(UserRepositoryProtocol.self) { _ in
            UserRepository()
        }.inObjectScope(.weak)

		return container
	}

	func buildAndPresentInitialController(in window: UIWindow?) {
		let container = buildDependencyContainer()

		let router = Router(assembly: container.resolve(), window: window)
		router.decideWhatModuleToShowFirst()
	}
}
