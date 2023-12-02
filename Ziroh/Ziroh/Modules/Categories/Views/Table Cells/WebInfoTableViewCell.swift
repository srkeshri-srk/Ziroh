//
//  WebInfoTableViewCell.swift
//  Ziroh
//
//  Created by Shreyansh Raj  Keshri on 02/12/23.
//

import UIKit

protocol WebInfoProtocol: AnyObject {
    func copy()
    func action()
}

class WebInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    weak var delegate: WebInfoProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureUI(title: String, subTitle: String, date: String) {
        titleLabel.text = title
        subTitleLabel.text = subTitle
        dateLabel.text = date
    }
    
    @IBAction func copyButtonAction(_ sender: UIButton) {
        delegate?.copy()
    }
    
    @IBAction func actionButtonAction(_ sender: UIButton) {
        delegate?.action()
    }
}
