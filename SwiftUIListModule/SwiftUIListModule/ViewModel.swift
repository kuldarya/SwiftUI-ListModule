//
//  ViewModel.swift
//  SwiftUIListModule
//
//  Created by Darya Kuliashova on 16/05/2022.
//

import Combine

final class ViewModel: ObservableObject {
    let employees: [Employee] = [
        Employee(occupation: "iOS Developer"),
        Employee(occupation: "Accountant"),
        Employee(occupation: "Support Manager"),
        Employee(occupation: "Flutter Developer"),
        Employee(occupation: "Project Manager")
    ]

}
