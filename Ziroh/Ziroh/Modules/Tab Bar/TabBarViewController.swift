//
//  TabBarViewController.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var controllers: [UIViewController] = [] {
        didSet {
            viewControllers = controllers
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupUI()
    }
    
    private func setupTabBar() {
        let passwordsVC = PasswordsViewController()
        let categoriesVC = CategoriesViewController()
        let photosVC = PhotosViewController()
        let settingsVC = SettingsViewController()

        passwordsVC.tabBarItem = UITabBarItem(title: "Passwords", image: UIImage(systemName: "square.stack.3d.up"), tag: 0)
        categoriesVC.tabBarItem = UITabBarItem(title: "Categories", image: UIImage(systemName: "text.justify.left"), tag: 1)
        photosVC.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "arrow.down.to.line"), tag: 2)
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 3)
        
        let passwordsNC = UINavigationController(rootViewController: passwordsVC)
        let categoriesNC = UINavigationController(rootViewController: categoriesVC)
        let photosNC = UINavigationController(rootViewController: photosVC)
        let settingsNC = UINavigationController(rootViewController: settingsVC)
        
        self.viewControllers = [passwordsNC, categoriesNC, photosNC, settingsNC]
    }
    
    private func setupUI() {
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().unselectedItemTintColor = .gray
    }
}
