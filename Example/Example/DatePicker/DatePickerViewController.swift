//
//  DatePickerViewController.swift
//  NBIBottomSheet_Example
//
//  Created by Bichon, Nicolas on 2018-10-02.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    // MARK: - Properties

    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker(frame: .zero)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupDatePicker()
    }

    private func setupDatePicker() {
        view.addSubview(datePicker)

        let heightConstraint = datePicker.heightAnchor.constraint(equalToConstant: 218)
        heightConstraint.priority = UILayoutPriority.defaultHigh

        NSLayoutConstraint.activate([
            heightConstraint,
            datePicker.topAnchor.constraint(equalTo: view.topAnchor),
            datePicker.leftAnchor.constraint(equalTo: view.leftAnchor),
            datePicker.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])

        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                datePicker.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -10.0)
            ])
        } else {
            NSLayoutConstraint.activate([
                datePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.0)
            ])
        }
    }

}
