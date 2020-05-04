//
//  ImagePostViewController.swift
//  ImageFilterEditor
//
//  Created by Tobi Kuyoro on 04/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit

class ImagePostViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - IBActions

    @IBAction func changeFilterTapped(_ sender: Any) {
    }

    
    @IBAction func savePhotoTapped(_ sender: Any) {
    }


    @IBAction func sliderValueChanged(_ sender: Any) {
    }

    
    @IBAction func chooseAnotherPhotoTapped(_ sender: Any) {
    }
}
