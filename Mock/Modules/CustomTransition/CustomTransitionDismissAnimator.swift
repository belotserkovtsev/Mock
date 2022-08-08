//
//  CustomTransitionDismissAnimator.swift
//  Mock
//
//  Created by b.belotserkovtsev on 08.08.2022.
//

import UIKit

class CustomTransitionDismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from) else {
            return
        }

        UIView.animate(withDuration: 0.4, animations: {
            fromViewController.view.alpha = 0
        }, completion: { _ in
            transitionContext.completeTransition(true)
            fromViewController.view.removeFromSuperview()
        })
    }
}
