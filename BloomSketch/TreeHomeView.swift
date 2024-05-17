//
//  TreeHomeView.swift
//  BloomSketch
//
//  Created by MacBook Pro on 17/05/24.
//
import SwiftUI

struct TreeHomeView: View {
    @State private var dailyDone = false
    @State private var streak = 5

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    if dailyDone {
                        Image("LeafOn")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 160, height: 160)
                            .foregroundColor(.red)
                    } else {
                        Image("LeafOff")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 160, height: 160)
                            .foregroundColor(.red)
                    }
                    
                    Text("5")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(Color(hex: 0x1B3F2E))
                }
            }
            .navigationBarTitle("Yobel's Den", displayMode: .inline)
        }
    }
}

#Preview {
    TreeHomeView()
}
