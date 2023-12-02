//
//  CategoriesViewModel.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import Foundation

protocol CategoriesProtocol: AnyObject {
    var cellCount: Int { get }
    
    static func builder() -> CategoriesViewModel
    func createUI()
    func getCellInfo(index: Int) -> CellTypes
}

class CategoriesViewModel: CategoriesProtocol {
    var cells: [CellTypes] = []
        
    var cellCount: Int {
        return cells.count
    }
    
    func createUI() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let formattedDate = dateFormatter.string(from: currentDate)

        cells.removeAll()
        cells.append(.divider)
        cells.append(.header(title: "Categories"))
        cells.append(.divider)
        cells.append(.header(title: "Favourites", isButtonAvailable: true))
        cells.append(.webInfo(title: "Website Name", subTitle: "Password", date: formattedDate))
        cells.append(.webInfo(title: "Google Name", subTitle: "Password", date: formattedDate))
        cells.append(.webInfo(title: "Facebook Name", subTitle: "Password", date: formattedDate))
        cells.append(.webInfo(title: "Instagram Name", subTitle: "Password", date: formattedDate))
        cells.append(.webInfo(title: "Twitter Name", subTitle: "Password", date: formattedDate))
    }
    
    func getCellInfo(index: Int) -> CellTypes {
        return cells[index]
    }
}

extension CategoriesViewModel {
    static func builder() -> CategoriesViewModel {
        let builder = CategoriesViewModel()
        builder.createUI()
        return builder
    }
}
