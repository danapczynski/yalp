//
//  FiltersViewController.swift
//  yalp
//
//  Created by Daniel Apczynski on 2/14/15.
//  Copyright (c) 2015 Dan Apczynski. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {

    @IBOutlet weak var backdrop: UIView!
    @IBAction func cancelButton(sender: UIBarButtonItem) {
        cancelButtonClicked()
    }
    @IBAction func applyButton(sender: UIBarButtonItem) {
        applyButtonClicked()
    }
    @IBOutlet weak var categoriesButton: UIButton!
    @IBOutlet weak var distanceButton: UIButton!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var dealsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backdrop.backgroundColor = UIColor(red: 175/255, green: 6/255, blue: 6/255, alpha: 1)
        self.categoriesButton.layer.cornerRadius = 5
        self.distanceButton.layer.cornerRadius = 5
        self.sortButton.layer.cornerRadius = 5
        self.dealsView.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
    }

//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let index = indexPath.row as Int
//        let cell = tableView.dequeueReusableCellWithIdentifier("FilterCell") as FilterCell
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//            case 0:   return 3
//            case 1:   return 2
//            case 2:   return 3
//            default:  return 1
//        }
//    }
//    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//            case 0:   return "Categories"
//            case 1:   return "Sort"
//            case 2:   return "Radius"
//            default:  return "Deals"
//        }
//    }
//    
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 30
//    }
//    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 4
//    }
    
    func cancelButtonClicked() -> Void {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func applyButtonClicked() -> Void {
        navigationController?.popViewControllerAnimated(true)
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
