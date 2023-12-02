//
//  HeaderTableViewCell.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        button.isHidden = true
    }
    
    func configureUI(title: String, isButtonAvailable: Bool = false) {
        self.title.text = title
        self.button.isHidden = !isButtonAvailable
    }
}
