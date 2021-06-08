//
//  TableViewCell.swift
//  PryanikyTestApp
//
//  Created by Дмитрий Орлянский on 08.06.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var container: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func fill(with pryanikObject: PryanikObject) {
        titleLabel.text = pryanikObject.name
    }
    
    func setupView() {
        container.layer.borderWidth = 3
        container.layer.borderColor = UIColor.systemGray.cgColor
        container.layer.cornerRadius = 15
    }
}
