//
//  PhotosViewModel.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 03/12/23.
//

import UIKit

protocol PhotosProtocol: AnyObject {
    var count: Int { get }
    var delegate: PhotoViewModelDelegate? { get set }

    static func builder() -> PhotosViewModel
    func getPhoto(of index: Int) -> Data?
}
 
protocol PhotoViewModelDelegate: AnyObject {
    func photoUpdate(at index: Int)
}

class PhotosViewModel: PhotosProtocol {
    typealias PhotoTuple = (url: URL, data: Data)
    
    //MARK: - Variables
    var noOfPhotos: Int = 100
    let photoURL: String = "https://source.unsplash.com/random/300x300"
    var photosData: [Int: PhotoTuple] = [:]
    weak var delegate: PhotoViewModelDelegate?
    var count: Int {
        return photosData.count
    }

    
    //MARK: - Methods
    func getPhoto(of index: Int) -> Data? {
        return photosData[index]?.data
    }
    
    func fetchImageData() {
        for index in 0..<noOfPhotos {
            DispatchQueue.global(qos: .background).sync {
                self.downloadImage(at: index, from: self.photoURL) {
                    self.delegate?.photoUpdate(at: index)
                }
            }
        }
    }
    
    func downloadImage(at index: Int, from urlString: String, completion: @escaping ()->Void) {
        guard let url = URL(string: urlString) else {
            completion()
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error downloading image: \(error.localizedDescription)")
                completion()
                return
            }
            
            if let data = data, let url = response?.url {
                self.appendData(to: index, with: (url, data))
                completion()
            }
        }.resume()
    }
    
    func appendData(to key: Int, with data: PhotoTuple) {
        if photosData[key] == nil {
            photosData[key] = data
        }
    }
}

extension PhotosViewModel {
    static func builder() -> PhotosViewModel {
        let builder = PhotosViewModel()
        builder.fetchImageData()
        return builder
    }
}
