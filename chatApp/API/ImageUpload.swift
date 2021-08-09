//
//  ImageUpload.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-26.
//

import Firebase
import UIKit


struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("debug  failed to uplaod image with error \(error.localizedDescription)")
                return
            }
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else {return }
                completion(imageUrl)
            }
        }
        
    }
}
