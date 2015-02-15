//
//  FiltersViewController.swift
//  yalp
//
//  Created by Daniel Apczynski on 2/14/15.
//  Copyright (c) 2015 Dan Apczynski. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController, CatFilterVCDelegate {

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
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var distancesLabel: UILabel!
    @IBOutlet weak var sortLabel: UILabel!
    var currentCategories = [String : Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backdrop.backgroundColor = UIColor(red: 175/255, green: 6/255, blue: 6/255, alpha: 1)
        self.categoriesButton.layer.cornerRadius = 5
        self.distanceButton.layer.cornerRadius = 5
        self.sortButton.layer.cornerRadius = 5
        self.dealsView.layer.cornerRadius = 5
        
        // Do any additional setup after loading the view.
    }
    
    func cancelButtonClicked() -> Void {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func applyButtonClicked() -> Void {
        navigationController?.popViewControllerAnimated(true)
    }
    
    func resetLabel(label: UILabel) -> Void {
        label.text = "None selected"
    }
    
    func categoriesFilterViewController(categoriesFilterVC: CategoriesFilterViewController, currentCatVCDictionary dict: [String : Bool]) {
        currentCategories = dict
        setCategoriesLabel(dict)
    }
    
    private func setCategoriesLabel(dict: [String : Bool]){
        if dict.isEmpty { resetLabel(categoriesLabel) }
        else {
            var categories = ""
            for (cat, bool) in dict {
                if bool {
                    if categories.isEmpty { categories += cat }
                    else { categories += ", \(cat)"}
                }
            }
            categoriesLabel.text = categories
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "categoriesSegue"{
            let vc = segue.destinationViewController as CategoriesFilterViewController
            vc.delegate = self
            vc.categoriesDictionary = currentCategories
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
