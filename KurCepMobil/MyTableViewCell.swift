import Foundation
import UIKit

class MyTablewViewCell:UITableViewCell {
    
    @IBOutlet weak var currencyIcon: UIImageView!
    @IBOutlet weak var fromLabel: UILabel!
    
    @IBOutlet weak var toLabel: UILabel!
    
    @IBOutlet weak var chageRateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var iconLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        currencyIcon?.image = UIImage(named: "circlepng")
        currencyIcon.frame = CGRect(x: 7, y:5 , width: 60, height:60)
    }
    
}
