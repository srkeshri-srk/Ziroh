//
//  SettingsViewController.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import UIKit

class SettingsViewController: BaseViewController {
    
    //MARK: - UI Components
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 32.0)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setViewConstrains()
    }
}


//MARK: - Private Methods
private extension SettingsViewController {
    func setupUI() {
        setNavBar(title: Constants.Settings.title)
        label.text = Constants.Settings.detailText
    }
    
    func setViewConstrains() {
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}

