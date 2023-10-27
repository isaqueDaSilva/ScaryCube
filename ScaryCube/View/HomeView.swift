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
            GeometryReader { fullView in
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
                        
                        if viewModel.showingGameView {
                            GameView()
                                .frame(width: fullView.size.width * 0.9, height: fullView.size.height * 0.65)
                                .background(.thinMaterial)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                        } else {
                            Spacer()
                            Button {
                                withAnimation {
                                    !viewModel.player.isEmpty ? viewModel.startOrPauseGame() : viewModel.showingProfile()
                                }
                            } label: {
                                Text(!viewModel.player.isEmpty ? "Start the Game" : "Create an Account")
                                    .font(.title3.bold())
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(.blue)
                                    .cornerRadius(10)
                            }
                            .padding(.bottom, 150)
                        }
                    }
                }
            }
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem {
                    Button {
                        viewModel.showingProfile()
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .font(.title2)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    if viewModel.showingGameView {
                        Button {
                            withAnimation {
                                viewModel.startOrPauseGame()
                            }
                        } label: {
                            Image(systemName: "arrowshape.turn.up.backward.fill")
                                .font(.title2)
                        }
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingProfileView, onDismiss: viewModel.getPlayer, content: {
                ProfileView()
            })
        }
    }
}
