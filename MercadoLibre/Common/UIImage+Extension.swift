//
//  UIImage+Extension.swift
//  MercadoLibre
//
//  Created by Raúl Pavón on 20/01/22.
//

import Foundation

import UIKit

extension UIImage {
    class func getImageFromURL(imageString: String) -> UIImage? {
        if let urlImage = URL(string: imageString) {
            let data = try? Data(contentsOf: urlImage)
            if let imageData = data {
                return UIImage(data: imageData) ?? UIImage()
            }
        }
        return nil
    }
    
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
            // Determine the scale factor that preserves aspect ratio
            let widthRatio = targetSize.width / size.width
            let heightRatio = targetSize.height / size.height
            
            let scaleFactor = min(widthRatio, heightRatio)
            
            // Compute the new image size that preserves aspect ratio
            let scaledImageSize = CGSize(
                width: size.width * scaleFactor,
                height: size.height * scaleFactor
            )

            // Draw and return the resized UIImage
            let renderer = UIGraphicsImageRenderer(
                size: scaledImageSize
            )

            let scaledImage = renderer.image { _ in
                self.draw(in: CGRect(
                    origin: .zero,
                    size: scaledImageSize
                ))
            }
            
            return scaledImage
        }
}
