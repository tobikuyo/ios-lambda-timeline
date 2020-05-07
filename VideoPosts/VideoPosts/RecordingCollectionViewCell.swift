//
//  RecordingCollectionViewCell.swift
//  VideoPosts
//
//  Created by Tobi Kuyoro on 07/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit
import AVFoundation

class RecordingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var playerView: VideoPlayerView!

    var recording: Recording?
    var player: AVPlayer!

    @IBAction func pressPlayTapped(_ sender: Any) {
        guard let recording = recording else { return }
        playMovie(url: recording.url)
    }

    private func playMovie(url: URL) {
        player = AVPlayer(url: url)
        let playerView = VideoPlayerView()
        playerView.player = player
        player.play()
    }
}
