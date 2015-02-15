//
//  ViewController.swift
//  yalp
//
//  Created by Daniel Apczynski on 2/10/15.
//  Copyright (c) 2015 Dan Apczynski. All rights reserved.
//

import UIKit

class YalpViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    var client: YelpClient!
    var searchResults: [NSDictionary]! = []
    
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
        
        // let filterButton = UIBarButtonItem(title: "Filter", style: .Plain, target: self, action: "onFilterButton")
        // self.navigationItem.leftBarButtonItem = filterButton
        
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
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        
        client.searchWithTerm(yalpSearchBar.text, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            self.searchResults = response["businesses"] as [NSDictionary]
//            println(self.searchResults)
            self.yalpTableView.reloadData()
            
            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }

    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

