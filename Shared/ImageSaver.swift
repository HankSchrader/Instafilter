//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Erik Mikac on 5/15/21.
//

import Foundation
import SwiftUI

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    func writeToPhotoAlbum(image: UIImage)  {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer ) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
    
}
