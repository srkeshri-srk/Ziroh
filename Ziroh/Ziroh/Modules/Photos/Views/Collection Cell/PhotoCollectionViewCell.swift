//
//  PhotoCollectionViewCell.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import UIKit


class PhotoCollectionViewCell: UICollectionViewCell {
    
    lazy var artworkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "placeholder")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
        setUpConstraints()
    }
    
    private func setupUI() {
        self.addBlurEffect(style: .systemChromeMaterialDark)
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
    }
    
    private func setUpConstraints() {
        addSubview(artworkImageView)
        
        NSLayoutConstraint.activate([
            artworkImageView.topAnchor.constraint(equalTo: topAnchor),
            artworkImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            artworkImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            artworkImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func reset() {
        artworkImageView.image = nil
    }
    
    func configureInfo(data: Data?) {
        reset()
        guard let data = data, let image = UIImage(data: data) else {
            artworkImageView.image = UIImage(named: "placeholder")
            return
        }
        
        DispatchQueue.main.async {
            self.artworkImageView.image = image
        }
    }
}
