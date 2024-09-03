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
        
        let parameters = ["access_key":"764a7f3061a8509b12484f62a2cd012c"]
        var urlComponents = URLComponents(string: "https://data.fixer.io/api/latest?access_key=764a7f3061a8509b12484f62a2cd012c")!
        
        urlComponents.queryItems = parameters.map{URLQueryItem(name: $0.key, value: $0.value)}
        
        guard let url = urlComponents.url else {
            print("invalid url")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {data,response,error in
            
            if let error = error {
                
                print("Error \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response status code not 200")
                return
            }
            
            if let data = data {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Data is in string: \(dataString)")
                }
                
                do {
                    let jsonDecoder = JSONDecoder()
                    let response:Response = try jsonDecoder.decode(Response.self, from: data)
                    print( "IS RESPONSE SUCCESS?" + String(response.success))
                } catch let errorInparsing {
                    print("Error IN parsing." + errorInparsing.localizedDescription)
                }
                
            }
      
        }
        task.resume()
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

