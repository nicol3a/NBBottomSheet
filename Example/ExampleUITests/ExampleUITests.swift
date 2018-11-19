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
        app.tables["TableViewBottomSheet"]/*@START_MENU_TOKEN@*/.staticTexts["Row 0"]/*[[".cells.staticTexts[\"Row 0\"]",".staticTexts[\"Row 0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

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
        tables/*@START_MENU_TOKEN@*/.staticTexts["Alert example"]/*[[".cells.staticTexts[\"Alert example\"]",".staticTexts[\"Alert example\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

    func openDatePickerBottomSheet() {
        tables/*@START_MENU_TOKEN@*/.staticTexts["Date picker example"]/*[[".cells.staticTexts[\"Date picker example\"]",".staticTexts[\"Date picker example\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

    func openTableViewBottomSheet() {
        tables.staticTexts["Table view example"].tap()
    }

    func tapOverlayToDismissBottomSheet() {
        children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 0).tap()
    }

}
