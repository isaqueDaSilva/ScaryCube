//
//  AccountView.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 26/10/23.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    var body: some View {
        NavigationView {
            List {
                Section("User Information:") {
                    Text(viewModel.player!.wrappedUsername)
                }
                
                Section("Points") {
                    ForEach(viewModel.player!.pointsLists) {
                        Text("\($0.point)")
                    }
                }
            }
        }
    }
}
