//
//  HomeView.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 24/10/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geo in
                    Image(.scary)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width)
                        .ignoresSafeArea()
                }
                
                VStack {
                    if viewModel.showingGameView == false {
                        Text("Welcome to ScaryCube")
                            .font(.title.bold())
                            .padding(.top, 50)
                    }
                    Spacer()
                    
                    if viewModel.showingGameView == false {
                        Button {
                            withAnimation {
                                viewModel.player == nil ? viewModel.startGame() : viewModel.showingProfile()
                            }
                        } label: {
                            Text(viewModel.player != nil ? "Start the Game" : "Create an Account")
                                .font(.title3.bold())
                                .foregroundColor(.white)
                                .padding(10)
                                .background(.blue)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 150)
                    } else {
                       GameView()
                            .frame(maxWidth: 400, maxHeight: 550)
                            .background(.thinMaterial)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                            .padding(.horizontal)
                            .padding(.bottom, 100)
                    }
                }
            }
            .preferredColorScheme(.dark)
            .toolbar {
                Button(action: {
                    viewModel.showingProfile()
                }, label: {
                    Image(systemName: "person.crop.circle")
                        .font(.title2)
                })
            }
            .sheet(isPresented: $viewModel.showingProfileView, onDismiss: viewModel.getPlayer, content: {
                ProfileView()
            })
        }
    }
}

#Preview {
    HomeView()
}
