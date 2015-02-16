//
//  CategoriesFilterViewController.swift
//  yalp
//
//  Created by Daniel Apczynski on 2/15/15.
//  Copyright (c) 2015 Dan Apczynski. All rights reserved.
//

import UIKit

protocol CatFilterVCDelegate : class {
    func categoriesFilterViewController(categoriesFilterVC: CategoriesFilterViewController, currentCatVCDictionary dict: [String : Bool])
}

class CategoriesFilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CategoryFilterCellDelegate {
    
    let categories = [
        "Thai", "Mexican", "Italian", "Mediterranean", "French"
    ]
    
    var categoriesDictionary = [String : Bool]()
    weak var delegate: CatFilterVCDelegate?

    @IBOutlet weak var categoriesTableView: UITableView!
    
    @IBAction func backButton(sender: UIBarButtonItem) {
        if (delegate != nil) {
            delegate!.categoriesFilterViewController(self, currentCatVCDictionary: categoriesDictionary)
        }
        backButtonClicked()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self

        // Do any additional setup after loading the view.
        categoriesTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = categoriesTableView.dequeueReusableCellWithIdentifier("CategoryFilterCell") as CategoryFilterCell
        cell.categoryLabel.text = categories[indexPath.row]
        cell.delegate = self
        if let value = categoriesDictionary[categories[indexPath.row]] {
            cell.categorySwitch.on = value
        } else {
            cell.categorySwitch.on = false
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func categoryFilterCell(categoryFilterCell: CategoryFilterCell, didChangeSwitchValue value: Bool) {
        let indexPath = categoriesTableView.indexPathForCell(categoryFilterCell)!
        categoriesDictionary[categories[indexPath.row]] = value
    }
    
    func backButtonClicked() {
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
