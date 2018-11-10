//
//  AlertViewController.swift
//  NBIBottomSheet_Example
//
//  Created by Bichon, Nicolas on 2018-10-02.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    // MARK: - View Life Cycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        view.roundCorners([.topLeft, .topRight], radius: 15)
    }

    // MARK: - Actions

    @IBAction func dismissButtonTapped(sender: AnyObject?) {
        dismiss(animated: true, completion: nil)
    }

}

// MARK: - UIView extension
private extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        var rect = bounds

        // Increase height (only useful for the iPhone X for now)
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.keyWindow {
                rect.size.height += window.safeAreaInsets.bottom
            }
        }

        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
