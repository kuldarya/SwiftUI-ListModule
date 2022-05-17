//
//  ViewModel.swift
//  SwiftUIListModule
//
//  Created by Darya Kuliashova on 16/05/2022.
//

import Combine

final class ViewModel: ObservableObject {
    @Published var selectedIndex: Int?

    var employees: [Employee] = [
        Employee(occupation: "iOS Developer"),
        Employee(occupation: "Accountant"),
        Employee(occupation: "Support Manager"),
        Employee(occupation: "Flutter Developer"),
        Employee(occupation: "Project Manager")
    ]

    func removeRow() {
        guard let index = selectedIndex, index >= 0 else { return }
        var newArray = employees
        newArray.remove(at: index)
        selectedIndex = nil
        employees = newArray
    }
}
