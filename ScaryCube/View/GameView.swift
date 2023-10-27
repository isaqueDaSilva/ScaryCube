//
//  GameView.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 24/10/23.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Cube(number: "\(viewModel.firstSortedNumber)")
                Cube(number: "\(viewModel.secondSortedNumber)")
            }
            
            if viewModel.playGame == false {
                Picker("Sides", selection: $viewModel.currentSide) {
                    ForEach(viewModel.sides, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Button {
                    viewModel.play()
                } label: {
                    Text("Start the game")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .padding(10)
                        .background(.blue)
                        .cornerRadius(10)
                }
                .padding()
            } else {
                ZStack {
                    Circle()
                        .stroke(.black.opacity(0.3), style: StrokeStyle(lineWidth: 10))
                        .padding([.top, .bottom, .horizontal])
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(viewModel.time) / 5)
                        .stroke(.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                        .rotationEffect(Angle(degrees: -90))
                        .animation(Animation.easeInOut(duration: 1), value: viewModel.time)
                        .padding([.top, .bottom, .horizontal])
                    
                    VStack {
                        Text("Time Remaining: \(viewModel.time)")
                            .font(.subheadline.bold())
                    }
                }
                .frame(width: 200, height: 200)
            }
        }
        .onReceive(viewModel.timer, perform: { newTime in
            viewModel.contdown()
        })
    }
}
