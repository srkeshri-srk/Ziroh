//
//  PhotosViewModel.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 03/12/23.
//

import UIKit

protocol PhotosProtocol: AnyObject {
    var count: Int { get }
    var noOfPhotos: Int { get set }
    var ispagginating: Bool { get set }
    var delegate: PhotoViewModelDelegate? { get set }

    static func builder() -> PhotosViewModel
    func getPhoto(of index: Int) -> Data?
}
 
protocol PhotoViewModelDelegate: AnyObject {
    func photoUpdate(at index: Int)
    func updateUI()
}

class PhotosViewModel: PhotosProtocol {
    typealias PhotoTuple = (url: URL, data: Data)
    
    //MARK: - Variables
    let photoURL: String = "https://source.unsplash.com/random/300x300"
    var photosData: [Int: PhotoTuple] = [:]
    var ispagginating: Bool = false
    weak var delegate: PhotoViewModelDelegate?
    var noOfPhotos: Int = 33 {
        didSet {
            fetchImageData()
        }
    }

    var count: Int {
        return photosData.count
    }

    
    //MARK: - Methods
    func getPhoto(of index: Int) -> Data? {
        return photosData[index]?.data
    }
    
    func fetchImageData() {
        self.delegate?.updateUI()
        
        guard !ispagginating else { return }
        
        let group = DispatchGroup()
        ispagginating = true
        
        for index in 0..<noOfPhotos {
            group.enter()
            
            DispatchQueue.global(qos: .background).sync {
                self.downloadImage(at: index, from: self.photoURL) {
                    self.delegate?.photoUpdate(at: index)
                    group.leave()
                }
            }
        }
        
        group.notify(queue: .main) {
            self.ispagginating = false
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
