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

        passwordsVC.tabBarItem = UITabBarItem(title: Constants.Passwords.title, image: UIImage(systemName: Constants.Passwords.icon), tag: 100)
        categoriesVC.tabBarItem = UITabBarItem(title: Constants.Categories.title, image: UIImage(systemName: Constants.Categories.icon), tag: 101)
        photosVC.tabBarItem = UITabBarItem(title: Constants.Photos.title, image: UIImage(systemName:Constants.Photos.icon), tag: 102)
        settingsVC.tabBarItem = UITabBarItem(title: Constants.Settings.title, image: UIImage(systemName: Constants.Settings.icon), tag: 103)
        
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
        
        self.selectedIndex = 1
    }
}
