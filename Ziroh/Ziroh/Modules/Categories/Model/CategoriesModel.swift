//
//  CategoriesModel.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import UIKit


enum CellTypes {
    case header(title: String, isButtonAvailable: Bool = false)
    case divider
    case categories(data: [CategoriesInfo])
    case webInfo(title: String, subTitle: String, date: String)
    
    var cellHeight: CGFloat {
        switch self {
        case .categories(_):
            return 160.0
        default:
            return UITableView.automaticDimension
        }
    }
}
