//
//  View.swift
//  FirebaseTest
//
//  Created by 伊藤璃乃 on 2024/05/14.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    @State private var name: String = ""
    @ObservedObject private var viewModel = UserViewModel()

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Save") {
                viewModel.saveUser(name: name) { error in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    } else {
                        print("User saved successfully.")
                    }
                }
            }
        }
    }
}
