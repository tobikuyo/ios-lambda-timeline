//
//  RecordViewController.swift
//  AudioComments
//
//  Created by Tobi Kuyoro on 06/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var timeElapsedLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!

    // MARK: - Properties

    var recordingURL: URL?
    var timer: Timer?

    var audioRecorder: AVAudioRecorder?
    var audioPlayer: AVAudioPlayer?

    var isRecording: Bool {
        audioRecorder?.isRecording ?? false
    }

    var isPlaying: Bool {
        audioPlayer?.isPlaying ?? false
    }

    lazy var timeIntervalFormatter: DateComponentsFormatter = {
        let formatting = DateComponentsFormatter()
        formatting.unitsStyle = .positional // 00:00  mm:ss
        formatting.zeroFormattingBehavior = .pad
        formatting.allowedUnits = [.minute, .second]
        return formatting
    }()

    // MARK: - View Lifecyle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    private func updateViews() {
        playButton.isSelected = isPlaying

        let currentTime = audioPlayer?.currentTime ?? 0.0
        let duration = audioPlayer?.duration ?? 0.0
        let timeRemaining = round(duration) - currentTime

        timeElapsedLabel.text = timeIntervalFormatter.string(from: currentTime) ?? "00:00"
        timeRemainingLabel.text = "-" + (timeIntervalFormatter.string(from: timeRemaining) ?? "00:00")

        timeSlider.minimumValue = 0
        timeSlider.maximumValue = Float(duration)
        timeSlider.value = Float(currentTime)

        recordButton.isSelected = isRecording
    }

    // MARK: Timer Methods

    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.030, repeats: true) { [weak self] (_) in
            guard let self = self else { return }
            self.updateViews()
        }
    }

    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }

    // MARK: - IBActions

    @IBAction func updateCurrentTime(_ sender: Any) {
    }

    @IBAction func togglePlayback(_ sender: Any) {
    }

    @IBAction func toggleRecording(_ sender: Any) {
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
