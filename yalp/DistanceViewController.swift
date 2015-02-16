//
//  DistanceViewController.swift
//  yalp
//
//  Created by Daniel Apczynski on 2/15/15.
//  Copyright (c) 2015 Dan Apczynski. All rights reserved.
//

import UIKit

protocol DistanceFilterVCDelegate : class {
    func distanceViewController(distanceFilterVC: DistanceViewController, dict: [String : Bool])
}

class DistanceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let distances = ["15 miles", "10 miles", "5 miles", "1 mile"]
    weak var delegate: DistanceFilterVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("DistanceFilterCell") as DistanceFilterCell
        
        cell.distanceLabel.text = distances[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println("HEY")
        navigationController?.popViewControllerAnimated(true)
        if (delegate != nil) {
            delegate!.distanceViewController(self, dict: [distances[indexPath.row] : true])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
