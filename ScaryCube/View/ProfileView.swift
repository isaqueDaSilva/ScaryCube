//
//  ProfileView.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 25/10/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        switch viewModel.profileState {
        case .created:
            AccountView()
                .environmentObject(viewModel)
        case .loading:
            ProgressView()
        case .nonCreated:
            CreateAccountView()
                .environmentObject(viewModel)
        }
    }
}
