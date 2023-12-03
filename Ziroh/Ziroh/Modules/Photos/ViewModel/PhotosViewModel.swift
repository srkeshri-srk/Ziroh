//
//  PhotosViewModel.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 03/12/23.
//

import UIKit

protocol PhotosProtocol: AnyObject {
    var count: Int { get }
    
    static func builder() -> PhotosViewModel
    func getPhoto(of index: Int) -> Data?
}

class PhotosViewModel: PhotosProtocol {
    var count: Int {
        return photoDataList.count
    }
    
    var noOfPhotos: Int = 1000
    let photoURL: String = "https://source.unsplash.com/random/300x300"
    var photoDataDict: [URL: Data] = [:]
    var photoDataList: [URL] = []
    
    func getPhoto(of index: Int) -> Data? {
        let key = photoDataList[index]
        
        return photoDataDict[key]
    }
    
    func fetchImageData() {
        for _ in 0..<noOfPhotos {
            downloadImage(from: photoURL)
        }
    }
    
    func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error downloading image: \(error.localizedDescription)")
                return
            }
            
            if let data = data, let url = response?.url {
                self.photoDataList.append(url)
                self.photoDataDict[url] = data
            }
        }.resume()
    }
}

extension PhotosViewModel {
    static func builder() -> PhotosViewModel {
        let builder = PhotosViewModel()
        builder.fetchImageData()
        return builder
    }
}
