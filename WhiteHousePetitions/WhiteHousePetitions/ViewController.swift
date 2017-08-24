//
//  ViewController.swift
//  WhiteHousePetitions
//
//  Created by Jose Melendez on 8/23/17.
//  Copyright © 2017 JoseMelendez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //Array of petitions
    var petitions = [[String: String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //The Url that we will be using, this url points to the whitehouse.gov servers
        let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        
        if let url = URL(string: urlString) {
            
            //The internet connection could be down so we need to use try?
            if let data = try? Data(contentsOf: url) {
                
                //We create a Json object
                let json = JSON(data: data)
                
                if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                    
                    //We are ok to parse
                    
                    parse(json: json)
                }
            }
        }
    
        
    }
    
    func parse(json: JSON) {
        
        for result in json["results"].arrayValue {
            
            let title = result["title"].stringValue
            
            let body = result["body"].stringValue
            
            let sigs = result["signatureCount"].stringValue
            
            let obj = ["title": title, "body": body, "sigs": sigs]
            
            petitions.append(obj)
        }
        
        //reload data
        tableView.reloadData()
    }
    
    
    //Number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return petitions.count
        
    }
    
    //Cell for row at
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let petition = petitions[indexPath.row]
        
        cell.textLabel?.text = petition["title"]
        
        cell.detailTextLabel?.text = petition["body"]
        
        return cell
    }

}

