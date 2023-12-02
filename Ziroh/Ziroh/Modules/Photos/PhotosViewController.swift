//
//  PhotosViewController.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import UIKit

class PhotosViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setViewConstrains()
    }
    
    private func setupUI() {
        setNavBar(title: Constants.Photos.navigationTitle, prefersLargeTitles: true)
    }
    
    private func setViewConstrains() {
        
    }
    
}
