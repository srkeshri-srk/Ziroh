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
        button.backgroundColor = .gray
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

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
    }
    
    private func registerTableView() {
        tableView.register(UINib(nibName: Constants.Categories.TableView.headerCell, bundle: nil), forCellReuseIdentifier: Constants.Categories.TableView.headerCell)
        tableView.register(UINib(nibName: Constants.Categories.TableView.dividerCell, bundle: nil), forCellReuseIdentifier: Constants.Categories.TableView.dividerCell)
        tableView.register(UINib(nibName: Constants.Categories.TableView.webInfoCell, bundle: nil), forCellReuseIdentifier: Constants.Categories.TableView.webInfoCell)

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

//MARK: - Collection View
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: HeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.Categories.TableView.headerCell, for: indexPath) as! HeaderTableViewCell
            if indexPath.row % 2 == 0 {
                cell.configureUI(title: "Custom", isButtonAvailable: true)
            }
            return cell
        } else if indexPath.row == 1 {
            let cell: DividerTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.Categories.TableView.dividerCell, for: indexPath) as! DividerTableViewCell
            return cell
        } else {
            let cell: WebInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.Categories.TableView.webInfoCell, for: indexPath) as! WebInfoTableViewCell
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
