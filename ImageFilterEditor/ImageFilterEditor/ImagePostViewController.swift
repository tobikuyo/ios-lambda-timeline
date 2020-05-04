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

enum Filter: String {
    case motionBlur = "CIMotionBlur"
    case process = "CIPhotoEffectProcess"
    case tonal = "CIPhotoEffectTonal"
    case mono = "CIPhotoEffectMono"
    case transfer = "CIPhotoEffectTransfer"
}

class ImagePostViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var changeFilterButton: UIButton!
    @IBOutlet weak var savePhotoButton: UIButton!

    // MARK: - Properties

    var originalImage: UIImage?
    var filter: Filter?
    private var context = CIContext(options: nil)

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        changeFilterButton.layer.cornerRadius = 4
        savePhotoButton.layer.cornerRadius = 4
    }

    // MARK: - Actions

    func updateImage(using filter: Filter) {
        if let originalImage = originalImage {
            let scaledImage = scaleImage(originalImage)
            imageView.image = applyFilter(filter, to: scaledImage)
            self.filter = filter
        } else {
            imageView.image = nil
        }
    }

    func scaleImage(_ image: UIImage) -> UIImage {
        var scaledSize = imageView.bounds.size
        let scale = UIScreen.main.scale // 1x (no modern iPhones) 2x 3x

        scaledSize = CGSize(width: scaledSize.width * scale, height: scaledSize.height * scale)
        let scaledImage = image.imageByScaling(toSize: scaledSize)

        return scaledImage ?? UIImage()
    }

    func applyFilter(_ filter: Filter, to image: UIImage) -> UIImage? {
        guard let cgImage = image.cgImage else { return nil }
        let ciImage = CIImage(cgImage: cgImage)

        let filter = CIFilter(name: filter.rawValue)!
        filter.setValue(ciImage, forKey: kCIInputImageKey)
        filter.setValue(slider.value, forKey: kCIInputIntensityKey)

        guard
            let outputCIImage = filter.outputImage,
            let outputCGImage = context.createCGImage(outputCIImage,
                                                      from: CGRect(origin: .zero, size: image.size)) else { return nil }

        return UIImage(cgImage: outputCGImage)
    }

    // MARK: - IBActions

    @IBAction func sliderValueChanged(_ sender: Any) {
        guard let filter = filter else { return }
        updateImage(using: filter)
    }

    @IBAction func changeFilterTapped(_ sender: Any) {
    }

    @IBAction func savePhotoTapped(_ sender: Any) {
    }

    @IBAction func chooseAnotherPhotoTapped(_ sender: Any) {
    }
}
