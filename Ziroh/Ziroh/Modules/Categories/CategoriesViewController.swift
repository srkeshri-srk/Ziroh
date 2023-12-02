//
//  CategoriesViewController.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import UIKit

class CategoriesViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setViewConstrains()
    }
    
    private func setupUI() {
        setNavBar(title: Constants.Categories.title)
    }
    
    private func setViewConstrains() {
        
    }
    
}

