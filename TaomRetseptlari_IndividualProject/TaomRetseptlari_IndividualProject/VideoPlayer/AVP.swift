//
//  AVP.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 25/07/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            VideoPlayerContainer()
                .frame(width: 800)

            Text("Go to cook")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.orange)
                .shadow(radius: 10)
                .padding()
               
        }
        .ignoresSafeArea()
    }
}

struct VideoPlayerContainer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        if let path = Bundle.main.path(forResource: "RedFire", ofType: "mp4") {
            let url = URL(fileURLWithPath: path)
            let player = AVPlayer(url: url)
            player.actionAtItemEnd = .none
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
                player.seek(to: .zero)
                player.play()
            }
            controller.player = player
            player.play()
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView()
    }
}
