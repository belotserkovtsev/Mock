//
//  CustomTransitionPresentAnimator.swift
//  Mock
//
//  Created by b.belotserkovtsev on 08.08.2022.
//

import UIKit

final class CustomTransitionPresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let toViewController = transitionContext.viewController(forKey: .to) else {
            return
        }

        containerView.addSubview(toViewController.view)
        toViewController.view.alpha = 0

        UIView.animate(withDuration: 0.4, animations: {
            toViewController.view.alpha = 1
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
}
