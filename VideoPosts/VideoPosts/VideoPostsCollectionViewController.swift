//
//  VideoPostsCollectionViewController.swift
//  VideoPosts
//
//  Created by Tobi Kuyoro on 06/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit
import AVFoundation

private let reuseIdentifier = "Cell"

class VideoPostsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions

    @IBAction func cameraButtonTapped(_ sender: Any) {
        requestPermissionAndShowCamera()
    }

    // MARK: - Actions

    private func requestPermissionAndShowCamera() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)

        switch status {
            case .notDetermined:
                requestPermission()
            case .restricted:
                fatalError("Tell user they need to request permission from parent UI")
            case .denied:
                fatalError("Tell user to enable in Settings: Popup from Audio to do this, or use a custom view")
            case .authorized:
                showCamera()
            default:
                fatalError("Handle new case for authorization")
        }
    }

    private func requestPermission() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            guard granted else {
                fatalError("Tell user to enable in Settings: Popup from Audio to do this, or use a custom view")
            }

            DispatchQueue.main.async {
                self.showCamera()
            }
        }
    }

    private func showCamera() {
        performSegue(withIdentifier: "ShowCamera", sender: self)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }
}
