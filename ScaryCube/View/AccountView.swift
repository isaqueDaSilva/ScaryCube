//
//  AccountView.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 26/10/23.
//

import SwiftUI

struct AccountView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ProfileViewModel
    var body: some View {
        NavigationView {
            List {
                Section("User Information:") {
                    Text(viewModel.playerInformations()?.wrappedUsername ?? "")
                }
                
                Section("Points") {
                    ForEach(viewModel.playerInformations()?.pointsLists ?? []) {
                        Text($0.wrappedPoint)
                    }
                }
            }
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
                
                ToolbarItem {
                    Button {
                        viewModel.deletePlayer()
                    } label: {
                        HStack {
                            Image(systemName: "trash.fill")
                        }
                    }
                }
            }
        }
    }
}
