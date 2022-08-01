//
//  LaunchPresenter.swift
//  Mock
//
//  Created by b.belotserkovtsev on 29.07.2022.
//

import Foundation

protocol LaunchViewOutput: AnyObject {
    func viewDidLoadEvent()
}

final class LaunchPresenter {
    weak var view: LaunchViewInput?

    private let router: RouterProtocol
    private let userRepository: UserRepositoryProtocol

    init(
        userRepository: UserRepositoryProtocol,
        router: RouterProtocol
    ) {
        self.userRepository = userRepository
        self.router = router
    }

    private func loadData() {
        userRepository.fetchUser()
        userRepository.fetchConfigs()
        userRepository.fetchRemoteCache()
    }
}

extension LaunchPresenter: LaunchViewOutput {
    func viewDidLoadEvent() {
        loadData()
    }
}
