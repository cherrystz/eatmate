//
//  uploadImage.swift
//  eatmate
//
//  Created by Cherryst 🍒 on 16/5/2565 BE.
//

import FirebaseStorage
import SwiftUI

func uploadImage(image: UIImage, name: String) {
    if let imageData = image.jpegData(compressionQuality: 1) {
        let storage  = Storage.storage()
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        storage.reference().child("imageProfile/\(name).jpg").putData(imageData, metadata: metadata) { (data, err) in
            if let err = err {
                print("an error has occurred - \(err.localizedDescription)")
            }
            else {
                print("image uploaded successfully")
            }
        }
    } else {
        print("couldn't unwrap/case image to data")
    }
}

func uploadGroupImage(image: UIImage, name: String) {
    if let imageData = image.jpegData(compressionQuality: 1) {
        let storage  = Storage.storage()
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        storage.reference().child("imageGroup/\(name).jpg").putData(imageData, metadata: metadata) { (data, err) in
            if let err = err {
                print("an error has occurred - \(err.localizedDescription)")
            }
            else {
                print("image uploaded successfully")
            }
        }
    } else {
        print("couldn't unwrap/case image to data")
    }
}
