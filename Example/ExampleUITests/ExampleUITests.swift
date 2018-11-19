//
//  ExampleUITests.swift
//  ExampleUITests
//
//  Created by Bichon, Nicolas on 2018-11-19.
//  Copyright © 2018 Nicolas Bichon. All rights reserved.
//

import XCTest

class ExampleUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
    }

    func testOpeningAlertBottomSheet() {
        app.openAlertBottomSheet()

        XCTAssertTrue(app.isDisplayingAlertBottomSheet)
    }

    func testTappingDismissButtonDismissesAlertBottomSheet() {
        app.openAlertBottomSheet()
        app.buttons["Dismiss"].tap()

        XCTAssertFalse(app.isDisplayingAlertBottomSheet)
    }

    func testTappingOverlayDismissesAlertBottomSheet() {
        app.openAlertBottomSheet()
        app.tapOverlayToDismissBottomSheet()

        XCTAssertFalse(app.isDisplayingAlertBottomSheet)
    }

    func testOpeningDatePickerBottomSheet() {
        app.openDatePickerBottomSheet()

        XCTAssertTrue(app.isDisplayingDatePickerBottomSheet)
    }

    func testTappingOverlayDismissesDatePickerBottomSheet() {
        app.openDatePickerBottomSheet()
        app.tapOverlayToDismissBottomSheet()

        XCTAssertFalse(app.isDisplayingDatePickerBottomSheet)
    }

    func testOpeningTableViewBottomSheet() {
        app.openTableViewBottomSheet()

        XCTAssertTrue(app.isDisplayingTableViewBottomSheet)
    }

    func testSelectingRowDismissesTableViewBottomSheet() {
        app.openTableViewBottomSheet()
        app.tables["TableViewBottomSheet"].staticTexts["Row 0"].tap()

        XCTAssertFalse(app.isDisplayingTableViewBottomSheet)
    }

    func testTappingOverlayDismissesTableViewBottomSheet() {
        app.openTableViewBottomSheet()
        app.tapOverlayToDismissBottomSheet()

        XCTAssertFalse(app.isDisplayingTableViewBottomSheet)
    }

}

private extension XCUIApplication {

    var isDisplayingAlertBottomSheet: Bool {
        return staticTexts["Alert"].exists
    }

    var isDisplayingDatePickerBottomSheet: Bool {
        return datePickers["DatePickerBottomSheet"].exists
    }

    var isDisplayingTableViewBottomSheet: Bool {
        return tables["TableViewBottomSheet"].exists
    }

    func openAlertBottomSheet() {
        tables.staticTexts["Alert example"].tap()
    }

    func openDatePickerBottomSheet() {
        tables.staticTexts["Date picker example"].tap()
    }

    func openTableViewBottomSheet() {
        tables.staticTexts["Table view example"].tap()
    }

    func tapOverlayToDismissBottomSheet() {
        children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 0).tap()
    }

}
