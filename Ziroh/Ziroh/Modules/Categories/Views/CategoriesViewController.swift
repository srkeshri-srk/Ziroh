//
//  CategoriesViewController.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import UIKit

class CategoriesViewController: BaseViewController {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Enter your request"
        searchBar.delegate = self
        searchBar.barTintColor = .black
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .fadeGrey15
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var viewModel: CategoriesProtocol = CategoriesViewModel.builder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setViewConstrains()
        registerTableView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupUI()
    }
    
    private func setupUI() {
        setNavBar(title: Constants.Categories.navigationTitle, prefersLargeTitles: true)
        addButton.layer.cornerRadius = addButton.bounds.size.height / 2
        addButton.addTarget(self, action: #selector(self.addButtonTapAction), for: .touchUpInside)
    }
    
    private func registerTableView() {
        tableView.register(UINib(nibName: Constants.Categories.TableView.headerCell, bundle: nil), forCellReuseIdentifier: Constants.Categories.TableView.headerCell)
        tableView.register(UINib(nibName: Constants.Categories.TableView.dividerCell, bundle: nil), forCellReuseIdentifier: Constants.Categories.TableView.dividerCell)
        tableView.register(UINib(nibName: Constants.Categories.TableView.webInfoCell, bundle: nil), forCellReuseIdentifier: Constants.Categories.TableView.webInfoCell)
        tableView.register(UINib(nibName: Constants.Categories.TableView.categoriesInfoCell, bundle: nil), forCellReuseIdentifier: Constants.Categories.TableView.categoriesInfoCell)
    }
    
    private func setViewConstrains() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 55),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    @objc func addButtonTapAction() {
        let alert = UIAlertController(title: "Add Button", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
}


//MARK: - Search Bar
extension CategoriesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            print("Search for: \(searchText)")
        }
        
        searchBar.resignFirstResponder()
    }
}


//MARK: - WebInfo Protocol
extension CategoriesViewController: WebInfoProtocol {
    func copy() {
        let alert = UIAlertController(title: "Web Copy", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func action() {
        let alert = UIAlertController(title: "Web Action ", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}


//MARK: - Header Protocol
extension CategoriesViewController: HeaderProtocol {
    func headerButtonTap() {
        let alert = UIAlertController(title: "Header Button", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}


extension CategoriesViewController: CategoriesInfoProtocol {
    func categoriesCollectionViewScrolling(_ scrollView: UIScrollView) {
        if let cell = self.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? HeaderTableViewCell {
            if scrollView.contentOffset.x > 100.0 {
                cell.button.isHidden = false
            } else {
                cell.button.isHidden = true
            }
        }
    }
}
