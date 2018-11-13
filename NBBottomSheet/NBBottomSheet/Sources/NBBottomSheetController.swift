//
//  NBBottomSheetController.swift
//  NBBottomSheet
//
//  Created by Bichon, Nicolas on 2018-10-02.
//

import UIKit

/// `NBBottomSheetController` is an object that can be used to present bottom sheets.
public class NBBottomSheetController: NSObject {

    /**
     Initializes a `NBBottomSheetController` object with a configuration.

     - parameter configuration: The configuration struct that specifies how NBBottomSheet should be configured.
     */
    public init(configuration: NBBottomSheetConfiguration? = nil) {
        if let configuration = configuration {
            NBConfiguration.shared = configuration
        }

        super.init()
    }

    /**
     Presents a bottom sheet view controller embedded in a navigation controller.

     - parameter viewController:          The presented view controller.
     - parameter containerViewController: The presenting view controller.
     */
    public func present(_ viewController: UIViewController, on containerViewController: UIViewController) {
        if viewController is UINavigationController {
            assertionFailure("Presenting 'UINavigationController' in a bottom sheet is not supported.")
            return
        }

        let width: CGFloat = UIScreen.main.bounds.width
        let maxHeight: CGFloat = UIScreen.main.bounds.height - NBConfiguration.shared.minimumTopSpacing
        var height: CGFloat = maxHeight

        viewController.view.setNeedsLayout()
        viewController.view.layoutIfNeeded()
        let size = viewController.view.systemLayoutSizeFitting(CGSize(width: width, height: maxHeight))

        height = size.height <= maxHeight ? size.height : maxHeight

        // Increase height (only useful for the iPhone X for now)
        if #available(iOS 11.0, *) {
            guard let window = UIApplication.shared.keyWindow else {
                return
            }

            let bottomPadding = window.safeAreaInsets.bottom
            if height + bottomPadding <= maxHeight {
                height += bottomPadding
            }
        }

        let positionY = UIScreen.main.bounds.height - height
        viewController.view.frame = CGRect(x: 0.0, y: positionY, width: width, height: height)

        let bottomSheetTransitioningDelegate = NBBottomSheetTransitioningDelegate()
        viewController.transitioningDelegate = bottomSheetTransitioningDelegate
        viewController.modalPresentationStyle = .custom

        containerViewController.present(viewController, animated: true, completion: nil)
    }
}
