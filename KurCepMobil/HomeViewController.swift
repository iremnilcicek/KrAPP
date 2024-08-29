//
//  ViewController.swift
//  KurCepMobil
//
//  Created by Apple on 28.08.2024.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("HomeViewController")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTablewViewCell", for:indexPath ) as! MyTablewViewCell
        
        cell.imageView?.image = nil
        cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
        cell.imageView?.frame.size = CGSize(width: 10, height: 10)
        cell.imageView?.clipsToBounds = true
        cell.imageView?.image = currencyList[indexPath.row].currencyIcon
        
        cell.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        cell.fromLabel.text = currencyList[indexPath.row].currencyName
        cell.toLabel.text = "TRY"
        cell.chageRateLabel.text = String(currencyList[indexPath.row].changeRate)
        cell.priceLabel.text = String(currencyList[indexPath.row].price)
        
        return cell
    }
    
    
 
}

