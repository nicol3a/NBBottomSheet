//
//  NBBottomSheetController.swift
//  NBBottomSheet
//
//  Created by Bichon, Nicolas on 2018-10-02.
//

import UIKit

/// `NBBottomSheetController` is an object that can be used to present bottom sheets.
public class NBBottomSheetController: NSObject {

    /// Initializes a `NBBottomSheetController` object with a configuration.
    /// - Parameter configuration: The configuration struct that specifies how NBBottomSheet should be configured.
    public init(configuration: NBBottomSheetConfiguration? = nil) {
        if let configuration = configuration {
            NBConfiguration.shared = configuration
        }

        super.init()
    }

    /// Presents a bottom sheet view controller embedded in a navigation controller.
    /// - Parameters:
    ///   - viewController: The presented view controller
    ///   - containerViewController: The presenting view controller.
    public func present(_ viewController: UIViewController, on containerViewController: UIViewController) {
        if viewController is UINavigationController {
            assertionFailure("Presenting 'UINavigationController' in a bottom sheet is not supported.")
            return
        }

        let bottomSheetTransitioningDelegate = NBBottomSheetTransitioningDelegate()
        viewController.transitioningDelegate = bottomSheetTransitioningDelegate
        viewController.modalPresentationStyle = .custom

        containerViewController.present(viewController, animated: true, completion: nil)
    }
}
