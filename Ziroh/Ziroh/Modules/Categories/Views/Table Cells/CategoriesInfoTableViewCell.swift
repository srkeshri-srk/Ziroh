//
//  CategoriesInfoTableViewCell.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 03/12/23.
//

import UIKit

class CategoriesInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var contentData: [CategoriesInfo] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        registerCollectionView()
    }
    
    private func setupUI() {
        
    }
    
    private func registerCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: Constants.Categories.CollectionView.categorieInfoCell, bundle: nil), forCellWithReuseIdentifier: Constants.Categories.CollectionView.categorieInfoCell)
    }
    
    func configureData(data: [CategoriesInfo]) {
        contentData = data
    }

}

extension CategoriesInfoTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategorieInfoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Categories.CollectionView.categorieInfoCell, for: indexPath) as! CategorieInfoCollectionViewCell
        cell.configureInfo(data: contentData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 160)
    }
    
}
