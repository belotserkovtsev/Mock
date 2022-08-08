//
//  Assembly.swift
//  Mock
//
//  Created by b.belotserkovtsev on 25.07.2022.
//

import UIKit
import Swinject

protocol AssemblyProtocol: AnyObject {
    func assembleLaunchModule(output: RouterProtocol) -> UIViewController
    func assembleTransitionModule() -> UIViewController
}

final class Assembly: AssemblyProtocol {
    private let container: Container

    init(container: Container) {
        self.container = container
    }

    func assembleLaunchModule(output: RouterProtocol) -> UIViewController {
        let presenter = LaunchPresenter(
            userRepository: container.resolve(),
            router: output
        )

        let vc = LaunchViewController(output: presenter)
        presenter.view = vc

        return vc
    }

    func assembleTransitionModule() -> UIViewController {
        CustomTransitionViewController()
    }
}
