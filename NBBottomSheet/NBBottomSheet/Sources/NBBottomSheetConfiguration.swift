//
//  NBBottomSheetConfiguration.swift
//  NBBottomSheet
//
//  Created by Bichon, Nicolas on 2018-10-30.
//

import UIKit

/// Encapsulates configuration information for the behavior of NBBottomSheet.
public struct NBBottomSheetConfiguration {

    /// The presentation and dismissal animation duration.
    public var animationDuration: TimeInterval = 0.0

    /// The minimum spacing between the bottom sheet and the top of the screen.
    public var minimumTopSpacing: CGFloat = 0.0

    /// The background view's color.
    public var backgroundViewColor: UIColor = .clear

    /// The default presentation and dismissal animation duration.
    public static let defaultAnimationDuration: TimeInterval = 0.4

    /// The default minimum spacing between the bottom sheet and the top of the screen.
    public static let defaultMinimumTopSpacing: CGFloat = 150.0

    /// The default background view's color.
    public static let defaultBackgroundViewColor: UIColor = UIColor.black.withAlphaComponent(0.7)

    /// Initializes a `NBBottomSheetConfiguration` object with optionally customizable behaviors.
    /// - Parameters:
    ///   - animationDuration: The presentation and dismissal animation duration.
    ///   - minimumTopSpacing: The minimum spacing between the bottom sheet and the top of the screen.
    ///   - backgroundViewAlpha: The background view's color.
    public init(animationDuration: TimeInterval = defaultAnimationDuration,
                minimumTopSpacing: CGFloat = defaultMinimumTopSpacing,
                backgroundViewColor: UIColor = defaultBackgroundViewColor) {
        self.animationDuration = animationDuration
        self.minimumTopSpacing = minimumTopSpacing
        self.backgroundViewColor = backgroundViewColor
    }
}
