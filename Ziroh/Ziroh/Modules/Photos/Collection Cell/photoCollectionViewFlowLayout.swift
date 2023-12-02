//
//  photoCollectionViewFlowLayout.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import UIKit

class photoCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()

        if let collectionView = collectionView {
            let spacing: CGFloat = 8.0
            let itemWidth = (collectionView.bounds.width - 4 * spacing) / 3.0

            itemSize = CGSize(width: itemWidth, height: itemWidth)

            sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
            minimumLineSpacing = spacing
            minimumInteritemSpacing = spacing
        }
    }
}
