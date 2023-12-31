//
//  Constants.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import Foundation


struct Constants {
    struct Passwords {
        static let title = "Passwords"
        static let navigationTitle = "Passwords"
        static let icon = "square.stack.3d.up"
        static let detailText = """
                    U N D E R
                    C O N S T R U C T I O N
                    """
    }
    
    struct Categories {
        static let title = "Categories"
        static let navigationTitle = "Search"
        static let icon = "text.justify.left"
        
        struct TableView {
            static let headerCell = "HeaderTableViewCell"
            static let dividerCell = "DividerTableViewCell"
            static let webInfoCell = "WebInfoTableViewCell"
            static let categoriesInfoCell = "CategoriesInfoTableViewCell"
        }
        
        struct CollectionView {
            static let categorieInfoCell = "CategorieInfoCollectionViewCell"
        }
    }
    
    struct Photos {
        static let title = "Photos"
        static let navigationTitle = "All"
        static let icon = "arrow.down.to.line"
        static let rightItemIcon = "arrow.right"
        static let PhotoCollectionViewCell = "PhotoCollectionViewCell"
    }
    
    struct Settings {
        static let title = "Settings"
        static let navigationTitle = "Settings"
        static let icon = "gearshape"
        static let detailText = """
                    U N D E R
                    C O N S T R U C T I O N
                    """
    }
    
}
