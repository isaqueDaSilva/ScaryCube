//
//  CreateAccountView.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 26/10/23.
//

import SwiftUI

struct CreateAccountView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ProfileViewModel
    var body: some View {
        NavigationView {
            Form {
                Section("Information") {
                    TextField("Insert your Username", text: $viewModel.username)
                }
                
                HStack {
                    Spacer()
                    Button {
                        viewModel.createProfile()
                    } label: {
                        Text("Create an Account")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .listRowBackground(Color(CGColor(red: 240, green: 240, blue: 246, alpha: 0)))
                
            }
            .navigationTitle("Create Account")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                }
            }
        }
    }
}

