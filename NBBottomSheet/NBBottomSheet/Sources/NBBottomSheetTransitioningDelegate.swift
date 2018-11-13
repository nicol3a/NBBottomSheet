//
//  NBBottomSheetTransitioningDelegate.swift
//  NBBottomSheet
//
//  Created by Bichon, Nicolas on 2018-10-02.
//

import UIKit

class NBBottomSheetTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return NBBottomSheetPresentationController(presentedViewController: presented, presenting: presenting)
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return NBBottomSheetPresentationTransition()
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return NBBottomSheetDismissalTransition()
    }
}
