//
//  TrailerView.swift
//  Movies
//
//  Created by Vivek Singh Mehta on 23/09/22.
//

import SwiftUI
import AVKit

struct TrailerView: View {
    let url: URL
    var body: some View {
        VideoPlayer(player: AVPlayer(url: url))
            .frame(width: 400, height: 300)
    }
}

struct TrailerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerView(url: URL(string: "https://www.youtube.com/watch?v=ehbmC1irQuY")!)
    }
}
