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
