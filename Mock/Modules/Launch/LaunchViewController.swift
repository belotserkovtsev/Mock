//
//  LaunchViewController.swift
//  Mock
//
//  Created by b.belotserkovtsev on 25.07.2022.
//

import UIKit
import SnapKit

protocol LaunchViewInput: AnyObject {

}

final class LaunchViewController: UIViewController {

    private var output: LaunchViewOutput?

    private lazy var transitionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Transition", for: .normal)
        button.addTarget(
            self,
            action: #selector(handleTransitionButtonTap),
            for: .touchUpInside
        )

        return button
    }()

    // MARK: Lifecycle

    init(
        output: LaunchViewOutput?
    ) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Cannot init vc")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        output?.viewDidLoadEvent()
    }

    // MARK: Private

    private func setupView() {
        view.backgroundColor = .mock.background
        view.addSubview(transitionButton)

        title = "Hello world"
        
        transitionButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

    @objc private func handleTransitionButtonTap() {
        output?.transitionButtonTapped()
    }
}

extension LaunchViewController: LaunchViewInput {

}
