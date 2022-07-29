//
//  Container+resolve.swift
//  Mock
//
//  Created by b.belotserkovtsev on 25.07.2022.
//

import Swinject

extension Container {
	func resolve<Service>() -> Service {
		resolve(Service.self)!
	}
}

extension Resolver {
	func resolve<Service>() -> Service {
		resolve(Service.self)!
	}
}
