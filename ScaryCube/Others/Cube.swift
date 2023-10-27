//
//  Cube.swift
//  ScaryCube
//
//  Created by Isaque da Silva on 25/10/23.
//

import SwiftUI

struct Cube: View {
    let number: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .cornerRadius(5)
                .frame(width: 120, height: 120)
            Rectangle()
                .strokeBorder(lineWidth: 5)
                .foregroundColor(.orange)
                .cornerRadius(5)
                .frame(width: 120, height: 120)
            
            Text(number)
                .font(.largeTitle.bold())
                .foregroundColor(.white)
        }
    }
}

#Preview {
    Cube(number: "2")
}
