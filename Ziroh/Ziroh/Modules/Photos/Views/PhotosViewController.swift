//
//  PhotosViewController.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import UIKit

class PhotosViewController: BaseViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = photoCollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .clear
        layout.scrollDirection = .vertical
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var viewModel: PhotosProtocol = PhotosViewModel.builder()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setViewConstrains()
        
        viewModel.delegate = self
    }
    
    private func setupUI() {
        setNavBar(title: Constants.Photos.navigationTitle, prefersLargeTitles: true)
        let rightNaviagtionButton = UIBarButtonItem(image: UIImage(systemName: Constants.Photos.rightItemIcon),
                                                    style: .done,
                                                    target: self,
                                                    action: #selector(self.rightNavigationButtonTapAction))
        rightNaviagtionButton.tintColor = .white
        self.navigationItem.rightBarButtonItem = rightNaviagtionButton
    }
    
    private func setViewConstrains() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Photos.PhotoCollectionViewCell)
    }
    
    @objc func rightNavigationButtonTapAction() {
        let alert = UIAlertController(title: "Hey!!", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.noOfPhotos
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Photos.PhotoCollectionViewCell, for: indexPath) as! PhotoCollectionViewCell
        cell.configureInfo(data: viewModel.getPhoto(of: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item >= viewModel.count - 4 && !viewModel.ispagginating {
            viewModel.noOfPhotos += viewModel.noOfPhotos
        }
    }
    
}

extension PhotosViewController: PhotoViewModelDelegate {
    func photoUpdate(at index: Int) {
        DispatchQueue.main.async {
            if let cell = self.collectionView.cellForItem(at: IndexPath(row: index, section: 0)) as? PhotoCollectionViewCell {
                cell.configureInfo(data: self.viewModel.getPhoto(of: index))
            }
        }
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
