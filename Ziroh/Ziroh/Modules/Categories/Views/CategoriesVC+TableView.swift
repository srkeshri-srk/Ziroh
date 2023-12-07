//
//  CategoriesVC+TableView.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import UIKit


//MARK: - Collection View
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.getCellInfo(index: indexPath.row) {
        case .header(let title, let isButtonAvailable):
            let cell: HeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.Categories.TableView.headerCell, for: indexPath) as! HeaderTableViewCell
            cell.configureUI(title: title, isButtonAvailable: isButtonAvailable)
            cell.delegte = self
            return cell
        case .divider:
            let cell: DividerTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.Categories.TableView.dividerCell, for: indexPath) as! DividerTableViewCell
            return cell
        case .categories(let data):
            let cell: CategoriesInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.Categories.TableView.categoriesInfoCell, for: indexPath) as! CategoriesInfoTableViewCell
            cell.configureData(data: data)
            cell.delegate = self
            return cell
        case .webInfo(let title, let subTitle, let date):
            let cell: WebInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.Categories.TableView.webInfoCell, for: indexPath) as! WebInfoTableViewCell
            cell.configureUI(title: title, subTitle: subTitle, date: date)
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.getCellInfo(index: indexPath.row).cellHeight
    }
}
