//
//  CustomTransitionViewController.swift
//  Mock
//
//  Created by b.belotserkovtsev on 08.08.2022.
//

import UIKit

final class CustomTransitionViewController: UIViewController {

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

    init() {
        super.init(nibName: nil, bundle: nil)

        modalPresentationStyle = .custom
        transitioningDelegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    @objc private func handleTransitionButtonTap() {
        dismiss(animated: true)
    }

    private func setupView() {
        view.backgroundColor = .red
        
        view.addSubview(transitionButton)
        transitionButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

extension CustomTransitionViewController: UIViewControllerTransitioningDelegate {
    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        CustomTransitionPresentAnimator()
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        CustomTransitionDismissAnimator()
    }
}
