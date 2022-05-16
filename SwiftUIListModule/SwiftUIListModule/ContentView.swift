//
//  ContentView.swift
//  SwiftUIListModule
//
//  Created by Darya Kuliashova on 13/05/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private(set) var viewModel: ViewModel = .init()

    var body: some View {
        NavigationView {
            List(viewModel.employees) { employee in
                EmployeeRow(employee: employee)
            }
            .listStyle(PlainListStyle())
            .padding(.top, 8)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Employees").font(.headline)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {
                        print("Add row")
                    }) {
                        Image(systemName: "plus")
                    }
                    Button(action: {
                        print("Delete row")
                    }) {
                        Image(systemName: "trash")
                    }
                }
            }
        }
    }
}

struct EmployeeRow: View {
    var employee: Employee

    var body: some View {
        Text(employee.occupation)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
