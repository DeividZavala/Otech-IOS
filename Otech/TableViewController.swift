//
//  TableViewController.swift
//  Otech
//
//  Created by David Zavala on 31/01/17.
//  Copyright © 2017 David Zavala. All rights reserved.
//

import UIKit
import Alamofire
import AVFoundation

class TableViewController: UITableViewController {
    
    typealias JsonStandard = [String : AnyObject]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func callAlamo(url: String) {
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            self.JSONParse(JsonData: response.data!)
            
        })
    }
    
    func  JSONParse(JsonData: Data) {
        do{
            var readableData = try JSONSerialization.jsonObject(with: JsonData, options: .mutableContainers) as! JsonStandard
            if let posts = readableData["posts"] as? JsonStandard{
                
            }
        }
        catch{
            print(error)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! TableViewCell1
        
        cell.mainImage?.image = UIImage(named:"16467341_743675765791740_1739932996_n")
        cell.mainLabel?.text = "OTECH"
        
        return cell
        
    }
    
}

