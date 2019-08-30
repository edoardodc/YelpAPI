//
//  ViewController.swift
//  API Yelp
//
//  Created by Edoardo de Cal on 22/01/2019.
//  Copyright © 2019 Edoardo de Cal. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var businesses = [Business]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell else { return UITableViewCell() }
        
        let business = businesses[indexPath.row]
        
        cell.labelName.text = business.name
        cell.labelRating.text = "Rating: \(business.rating)"
        
        cell.imageResturant.sd_setImage(with: URL(string: business.image_url), placeholderImage: UIImage(named: "placeholder.png"))
        
        let imageName = "stars_regular_\(business.rating)"
        
        cell.imageRating.image = UIImage(named: imageName)
        
        cell.labelRating.text = "Basato su \(business.review_count) recensioni"

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonLink = "https://api.yelp.com/v3/businesses/search?latitude=45.456957&longitude=9.182628"
        
        guard let url = URL(string: jsonLink) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("Bearer KQY2Ff1QJ-gz65AGE7x1U05BTFvwvO8d6xEcm6iTJAn4bquTUjrH5PkulTU8p_lMshoFWRQCXjx6Ao5ZhOi3UIeTApMWQppfyQSzkCNgz5506Kea4SRHW2AK6WlEXHYx", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            let outputStr  = String(data: data!, encoding: String.Encoding.utf8) as String!
            print(outputStr)
            
            guard let data = data else {
                print("Error while decoding data")
                return
            }
            do {
                let businessList = try JSONDecoder().decode(YelpBusinesses.self, from: data)
                self.businesses = businessList.businesses
                print(businessList)
            } catch let jsonErr {
                print("Error", jsonErr)
            }
            
            }.resume()
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let business = businesses[indexPath.row]
        UIApplication.shared.open(((business.url)!), options: [:], completionHandler: nil)
        
        print("Hai cliccato \(indexPath.row)")
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

