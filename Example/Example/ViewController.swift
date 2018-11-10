//
//  ViewController.swift
//  Example
//
//  Created by Bichon, Nicolas on 2018-11-02.
//  Copyright © 2018 Nicolas Bichon. All rights reserved.
//

import UIKit
import NBBottomSheet

class ViewController: UIViewController {

    // MARK: - Properties

    private let bottomSheetController = NBBottomSheetController()

    // MARK: - Actions

    @IBAction func alertButtonTapped(sender: AnyObject?) {
        let viewController = AlertViewController()
        bottomSheetController.present(viewController, on: self)
    }

    @IBAction func tableViewButtonTapped(sender: AnyObject?) {
        let viewController = TableViewController()
        bottomSheetController.present(viewController, on: self)
    }

    @IBAction func datePickerButtonTapped(sender: AnyObject?) {
        let viewController = DatePickerViewController()
        bottomSheetController.present(viewController, on: self)
    }

}


