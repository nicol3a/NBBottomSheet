//
//  NBBottomSheetPresentationController.swift
//  NBBottomSheet
//
//  Created by Bichon, Nicolas on 2018-10-02.
//

import UIKit

class NBBottomSheetPresentationController: UIPresentationController {

    // MARK: - Properties

    /// Overlay presented under the bottom sheet.
    private lazy var backgroundView: UIView? = {
        guard let containerView = containerView else {
            return nil
        }

        let backroundView = UIView(frame: containerView.bounds)

        backroundView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        backroundView.backgroundColor = UIColor.black.withAlphaComponent(0.7)

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismiss))
        backroundView.addGestureRecognizer(gestureRecognizer)

        return backroundView
    }()

    // MARK: - Actions

    /**
     Dismisses the presented view controller.
     */
    @objc func dismiss() {
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }

    // MARK: - UIPresentationController

    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()

        guard let containerView = containerView, let backgroundView = backgroundView, let presentedView = presentedView else {
            return
        }

        backgroundView.alpha = 0.0

        containerView.addSubview(backgroundView)
        containerView.addSubview(presentedView)

        let showBackgroundView = { (_: UIViewControllerTransitionCoordinatorContext) -> Void in
            backgroundView.alpha = 1.0
        }

        presentingViewController.transitionCoordinator?.animate(alongsideTransition: showBackgroundView, completion: nil)
    }

    override open func presentationTransitionDidEnd(_ completed: Bool) {
        if !completed {
            backgroundView?.removeFromSuperview()
        }
    }

    override open func dismissalTransitionWillBegin() {
        guard let backgroundView = backgroundView else {
            return
        }

        let hideBackgroundView = { (_: UIViewControllerTransitionCoordinatorContext) -> Void in
            backgroundView.alpha = 0.0
        }

        presentingViewController.transitionCoordinator?.animate(alongsideTransition: hideBackgroundView, completion: nil)
    }

    override open func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            backgroundView?.removeFromSuperview()
        }
    }

    override open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        guard let containerView = containerView, let backgroundView = backgroundView else {
            return
        }

        let resetBackgroundViewFrame: ((UIViewControllerTransitionCoordinatorContext) -> Void) = { _ in
            backgroundView.frame = containerView.bounds
        }

        coordinator.animate(alongsideTransition: resetBackgroundViewFrame, completion: nil)
    }
}
