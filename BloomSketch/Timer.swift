//
//  Timer.swift
//  BloomSketch
//
//  Created by student on 31/05/24.
//

import SwiftUI

struct DrawTimer: View {
    @State private var timeRemaining: TimeInterval = 180
    @State private var timer: Timer?
    @State private var isRunning: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                ZStack{
                    Circle()
                        .stroke(lineWidth: 20)
                        .opacity(0.3)
                    Circle()
                        .trim(from: 0, to: CGFloat(1 - (timeRemaining / 180)))
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .rotationEffect(.degrees(-90))
                        .foregroundColor(timeRemaining <= 10 ? .red : timeRemaining <= 60 ? .yellow : .blue) // Change color conditionally

                    Text(formattedTime())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: 200)
                HStack {
                    Button {
                        isRunning.toggle()
                        if isRunning {
                            startTimer()
                        } else {
                            stopTimer()
                        }
                    } label: {
                        Image(systemName: isRunning ? "stop.fill" : "play.fill")
                            .foregroundStyle(.foreground)
                            .frame(width: 50, height: 50)
                    }
                }
            }
            .padding(.horizontal, 30)
            .navigationTitle("Time")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func formattedTime() -> String {
        let minutes = Int(timeRemaining) / 60
        let second = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, second)
    }
    
    private func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            }else{
                stopTimer()
            }
        }
    }
    
    private func stopTimer(){
        isRunning = false
        timer?.invalidate()
        timeRemaining = 180
    }
    
    
    
}

#Preview {
    DrawTimer()
}
