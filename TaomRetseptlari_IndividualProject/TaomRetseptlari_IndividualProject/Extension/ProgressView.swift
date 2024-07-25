//
//  ProgressView.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//

import SwiftUI
import Combine

struct FoodProgressView: View {
    @State private var progress: CGFloat = 0.0
    @State private var isWaiting = false
    @State private var animationAmount: CGFloat = 1.0
    private let progressPublisher = PassthroughSubject<CGFloat, Never>()
    @State private var cancellable: AnyCancellable?

    var body: some View {
        VStack {
        
            Image("foodProgress")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
                .scaleEffect(animationAmount)
                .animation(
                    Animation.easeInOut(duration: 0.5)
                        .repeatForever(autoreverses: true)
                )
                .padding()
        }
        .onAppear {
            setupProgressPublisher()
            startWaiting()
        }
        .onDisappear {
            cancellable?.cancel()
        }
    }

    func setupProgressPublisher() {
        cancellable = progressPublisher
            .sink { value in
                self.progress = value
                if value >= 1.0 {
                    self.isWaiting = false
                    self.animationAmount = 1.0
                }
            }
    }

    func startWaiting() {
        self.progress = 0.0
        self.isWaiting = true
        self.animationAmount = 1.2

        var currentProgress: CGFloat = 0.0
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            if currentProgress < 1.0 {
                currentProgress += 0.1
                self.progressPublisher.send(currentProgress)
            } else {
                timer.invalidate()
            }
        }
    }
}



struct ProgresssView: View {
    var body: some View {
        VStack {
        Text("A minute")
                .padding()
                .foregroundColor(.black)
        }
    }
}
