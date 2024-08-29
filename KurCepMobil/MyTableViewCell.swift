//
//  MyTableViewCell.swift
//  KurCepMobil
//
//  Created by Apple on 28.08.2024.
//

import Foundation
import UIKit

class MyTablewViewCell:UITableViewCell {
    
    @IBOutlet weak var currencyIcon: UIImageView!
    @IBOutlet weak var fromLabel: UILabel!
    
    @IBOutlet weak var toLabel: UILabel!
    
    @IBOutlet weak var chageRateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //let margins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        //contentView.frame = contentView.frame.inset(by: margins)
        contentView.layer.cornerRadius = 8
    }
    
}
