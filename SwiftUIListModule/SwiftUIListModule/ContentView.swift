//
//  ContentView.swift
//  SwiftUIListModule
//
//  Created by Darya Kuliashova on 13/05/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel = .init()
    @State private var showingSheet = false
    @State private var newEmployee = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(viewModel.employees.enumerated()), id: \.offset) { index, element in
                    Button {
                        viewModel.selectedIndex = index
                    } label: {
                        EmployeeRow(employee: viewModel.employees[index])
                    }
                    .listRowBackground(index == viewModel.selectedIndex ? Color.gray : Color.clear)
                }
            }
            .listStyle(PlainListStyle())
            .padding(.top, 8)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Employees").font(.headline)
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: {
                    showingSheet = true
                }) {
                    Image(systemName: "plus")
                }

                Button(action: {
                    viewModel.removeRow()
                }) {
                    Image(systemName: "trash")
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

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var newEmployee: String

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Add new employee title", text: $newEmployee)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.leading, .trailing], 16)
                Spacer()
            }
            .navigationTitle("Add New Employee")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    Button("Done") {
                       // {} from sheet
                        dismiss()
                    },
                trailing:
                    Button("Cancel") {
                        newEmployee = ""
                        dismiss()
                    })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
