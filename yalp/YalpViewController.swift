//
//  ViewController.swift
//  yalp
//
//  Created by Daniel Apczynski on 2/10/15.
//  Copyright (c) 2015 Dan Apczynski. All rights reserved.
//

import UIKit

class YalpViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, FiltersVCDelegate {
    var client: YelpClient!
    var searchResults: [NSDictionary]! = []
    var filters = [ String : [ String : Bool]]()
    
    @IBOutlet weak var yalpTableView: UITableView!
    let yalpSearchBar = UISearchBar()
    
    let yelpConsumerKey = "vxKwwcR_NMQ7WaEiQBK_CA"
    let yelpConsumerSecret = "33QCvh5bIF5jIHR5klQr7RtBDhQ"
    let yelpToken = "uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV"
    let yelpTokenSecret = "mqtKIxMIR4iBtBPZCmCLEb-Dz3Y"
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        yalpTableView.delegate = self
        yalpTableView.dataSource = self
        yalpSearchBar.delegate = self
        yalpTableView.rowHeight = UITableViewAutomaticDimension
        yalpTableView.estimatedRowHeight = 100
        self.navigationItem.titleView = yalpSearchBar
        
        performSearch("")

        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var index = indexPath.row
        var result = self.searchResults![index]
        
        if(result["image_url"] == nil){ println(result) }
        
        var name = result["name"] as? String
        var reviewsCount = result["review_count"] as? Int
        var imageUrl = result["image_url"] as? String
        var ratingImageUrl = result["rating_img_url"] as? String
        
        let cell = yalpTableView.dequeueReusableCellWithIdentifier("YalpTableViewCell") as YalpTableViewCell
        cell.resultNameLabel.text = "\(index + 1). \(name!)"
        cell.resultNameLabel.sizeToFit()
        cell.reviewsCountLabel.text = "\(reviewsCount!) Reviews"
        if imageUrl != nil {
            cell.resultImage.setImageWithURL(NSURL(string: "\(imageUrl!)"))
        } else {
            cell.resultImage.setImageWithURL(NSURL(string: ""))
        }
        cell.resultRatingImage.setImageWithURL(NSURL(string: "\(ratingImageUrl!)"))
        
        return cell
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        performSearch(searchText)
    }
    
    func performSearch(searchText: String) -> Void {
        let term = getTerm()
        let categories = getCategories()
        let distance = getDistance()
        
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        
        client.searchWithTerm(term, categories: categories, distance: distance, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            self.searchResults = response["businesses"] as [NSDictionary]
            println("categories: \(categories)")
            if !categories.isEmpty { println(self.searchResults) }
            self.yalpTableView.reloadData()
            
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }

    }
    
    func getTerm() -> String {
        switch (yalpSearchBar.text) {
            case "": return "restaurants"
            default: return yalpSearchBar.text
        }
    }
    
    func getCategories() -> String {
        var str = ""
        if (!filters.isEmpty && filters["categories"] != nil) {
            for (category, bool) in filters["categories"]! {
                if bool {
                    if str.isEmpty { str += category }
                    else {str += ",\(category)" }
                }
            }
        }
        return str.lowercaseString
    }
    
    func getDistance() -> Int {
        var int = 40000
        if (!filters.isEmpty && filters["distance"] != nil) {
            for (distance, bool) in filters["distance"]! {
                if bool {
                    switch distance {
                    case "15 miles": int = 24140
                    case "10 miles": int = 16093
                    case "5 miles": int = 8047
                    default: int = 1609 // 1 mile
                    }
                }
            }
        }
        return int
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func filtersViewController(filtersVC: FiltersViewController, filters: [String : [String : Bool]]) {
        println("filters in YALP OVERLORD: \(filters)")
        self.filters = filters
        performSearch(getTerm())
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "filtersSegue"{
            let vc = segue.destinationViewController as FiltersViewController
            vc.delegate = self
            
            if (!filters.isEmpty && filters["categories"] != nil) {
                vc.currentCategories = filters["categories"]!
                vc.previousCategories = filters["categories"]!
            }
            
            if (!filters.isEmpty && filters["distance"] != nil) {
                vc.currentDistance = filters["distance"]!
                vc.previousDistance = filters["distance"]!
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

