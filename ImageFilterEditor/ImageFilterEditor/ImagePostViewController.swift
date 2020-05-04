//
//  ImagePostViewController.swift
//  ImageFilterEditor
//
//  Created by Tobi Kuyoro on 04/05/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit
import Photos
import CoreImage
import CoreImage.CIFilterBuiltins

class ImagePostViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var changeFilterButton: UIButton!
    @IBOutlet weak var savePhotoButton: UIButton!

    // MARK: - Properties

    var originalImage: UIImage?

    private var motionBlur = CIFilter(name: "CIMotionBlur")
    private var sepiaTone = CIFilter(name: "CIPhotoEffectProcess")
    private var tonal = CIFilter(name: "CIPhotoEffectTonal")
    private var mono = CIFilter(name: "CIPhotoEffectMono")
    private var transfer = CIFilter(name: "CIPhotoEffectTransfer")

    private var context = CIContext(options: nil)

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeFilterButton.layer.cornerRadius = 4
        savePhotoButton.layer.cornerRadius = 4
    }

    // MARK: - Actions

    func applyFilter(to image: UIImage, with filter: CIFilter) -> UIImage? {
        guard let cgImage = image.cgImage else { return nil }
        let ciImage = CIImage(cgImage: cgImage)

        filter.setValue(ciImage, forKey: kCIInputImageKey)
        filter.setValue(slider.value, forKey: kCIInputIntensityKey)

        guard
            let outputCIImage = filter.outputImage,
            let outputCGImage = context.createCGImage(outputCIImage,
                                                      from: CGRect(origin: .zero, size: image.size)) else { return nil }

        return UIImage(cgImage: outputCGImage)
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
