//
//  CategoriesModel.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import Foundation


enum CellTypes {
    case header(title: String, isButtonAvailable: Bool = false)
    case divider
    case categories
    case webInfo(title: String, subTitle: String, date: String)
}
