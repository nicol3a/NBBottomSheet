//
//  ViewController.swift
//  Example
//
//  Created by Bichon, Nicolas on 2018-11-02.
//  Copyright © 2018 Nicolas Bichon. All rights reserved.
//

import UIKit
import NBBottomSheet

enum BottomSheetType: Int, CaseIterable {
    case alert
    case datePicker
    case tableView

    var title: String {
        switch self {
        case .alert:
            return "Alert example"
        case .datePicker:
            return "Date picker example"
        case .tableView:
            return "Table view example"
        }
    }
}

class ViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var tableView: UITableView!

    private let types: [BottomSheetType] = BottomSheetType.allCases
    private let bottomSheetController = NBBottomSheetController()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    // MARK: - Setup

    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BottomSheetTypeCell")
    }

    // MARK: - Actions

    private func presentBottomSheet(with type: BottomSheetType) {
        var viewController: UIViewController!

        switch type {
        case .alert:
            viewController = AlertViewController()
        case .datePicker:
            viewController = DatePickerViewController()
        case .tableView:
            viewController = TableViewController()
        }

        bottomSheetController.present(viewController, on: self)
    }

}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BottomSheetTypeCell", for: indexPath)

        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = BottomSheetType(rawValue: indexPath.row)?.title

        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let type = BottomSheetType(rawValue: indexPath.row) {
            presentBottomSheet(with: type)
        }
    }
}
