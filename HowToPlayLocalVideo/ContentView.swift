//
//  ContentView.swift
//  HowToPlayLocalVideo
//
//  Created by ramil on 29/09/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI
import AVKit

let path = Bundle.main.path(forResource: "sample", ofType: "mp4")

struct ContentView: View {
    var body: some View {
        
        PlayerView()
        
//        Button("Play") {
//
//            let player = AVPlayer(url: URL(fileURLWithPath: path!))
//            let videoPlayer = AVPlayerViewController()
//
//            videoPlayer.player = player
//
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PlayerView: UIViewRepresentable {
  func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
  }
  func makeUIView(context: Context) -> UIView {
    return PlayerUIView(frame: .zero)
  }
}

class PlayerUIView: UIView {
  private let playerLayer = AVPlayerLayer()
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let url = URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!
    let player = AVPlayer(url: url)
    player.play()
    
    playerLayer.player = player
    layer.addSublayer(playerLayer)
  }
  required init?(coder: NSCoder) {
   fatalError("init(coder:) has not been implemented")
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    playerLayer.frame = bounds
  }
}
