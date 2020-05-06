//
//  RecordViewController.swift
//  AudioComments
//
//  Created by Tobi Kuyoro on 06/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var timeElapsedLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!

    // MARK: - View Lifecyle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
