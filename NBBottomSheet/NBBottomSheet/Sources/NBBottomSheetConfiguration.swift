//
//  NBBottomSheetConfiguration.swift
//  NBBottomSheet
//
//  Created by Bichon, Nicolas on 2018-10-30.
//

import UIKit

/// Encapsulates configuration information for the behavior of NBBottomSheet.
public struct NBBottomSheetConfiguration {

    public enum SheetSize {
        case fixed(_ height: CGFloat)
    }

    /// The presentation and dismissal animation duration.
    public var animationDuration: TimeInterval = 0.0

    /// The sheet's size.
    public var sheetSize: SheetSize = .fixed(300)

    /// The background view's color.
    public var backgroundViewColor: UIColor = .clear

    /// The default presentation and dismissal animation duration.
    public static let defaultAnimationDuration: TimeInterval = 0.4

    /// The default sheet's size.
    public static let defaultSheetSize: SheetSize = .fixed(300)

    /// The default background view's color.
    public static let defaultBackgroundViewColor: UIColor = UIColor.black.withAlphaComponent(0.7)

    /// Initializes a `NBBottomSheetConfiguration` object with optionally customizable behaviors.
    /// - Parameters:
    ///   - animationDuration: The presentation and dismissal animation duration.
    ///   - sheetSize: The sheet's size.
    ///   - backgroundViewAlpha: The background view's color.
    public init(animationDuration: TimeInterval = defaultAnimationDuration,
                sheetSize: SheetSize = defaultSheetSize,
                backgroundViewColor: UIColor = defaultBackgroundViewColor) {
        self.animationDuration = animationDuration
        self.sheetSize = sheetSize
        self.backgroundViewColor = backgroundViewColor
    }
}
