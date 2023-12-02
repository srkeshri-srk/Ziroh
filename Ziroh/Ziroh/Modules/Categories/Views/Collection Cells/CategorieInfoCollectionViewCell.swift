//
//  CategorieInfoCollectionViewCell.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 03/12/23.
//

import UIKit


struct CategoriesInfo {
    var artwork: UIImage? = [UIImage(systemName: "paperplane.fill"), UIImage(systemName: "figure.walk"), UIImage(systemName: "sun.snow.fill")].randomElement() ?? UIImage(systemName: "paperplane.fill")
    var title: String
    var subTitle: String? = "0 items"
}

class CategorieInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        blurView.layer.cornerRadius = 10.0
        blurView.layer.masksToBounds = true
        blurView.backgroundColor = .clear
        blurView.addBlurEffect(style: .dark)
    }
    
    func configureInfo(data: CategoriesInfo) {
        artworkImageView.image = data.artwork
        titleLabel.text = data.title
        subTitleLabel.text = data.subTitle
    }
}


extension UIView {
    func addBlurEffect(style: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.insertSubview(blurEffectView, at: 0)
    }
}
