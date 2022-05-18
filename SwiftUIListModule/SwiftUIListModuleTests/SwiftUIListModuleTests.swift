//
//  SwiftUIListModuleTests.swift
//  SwiftUIListModuleTests
//
//  Created by Darya Kuliashova on 13/05/2022.
//

import XCTest
@testable import SwiftUIListModule

class SwiftUIListModuleTests: XCTestCase {
    var sut: ViewModel!

    override func setUpWithError() throws {
        sut = ViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testViewModelAddsNewRowCorrectly() {
        //Given
        let array = [
            Employee(occupation: "iOS Developer"),
            Employee(occupation: "Accountant"),
            Employee(occupation: "Support Manager")
        ]
        sut.employees = array

        //Action
        sut.addRow(newEmployee: "ios")

        //Assert
        XCTAssertNotEqual(array, sut.employees)
    }

    func testViewModelDeletesRowCorrectly() {


        

    }
}

extension Employee: Equatable {
    public static func == (lhs: Employee, rhs: Employee) -> Bool {
        lhs.occupation == rhs.occupation
    }
}
