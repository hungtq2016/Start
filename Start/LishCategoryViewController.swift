//
//  LishCategoryViewController.swift
//  Start
//
//  Created by tran quoc Hung on 7/12/16.
//  Copyright © 2016 GMO-Z. All rights reserved.
//

import UIKit

protocol categoryDelegate {
    func reloaddataCategory(category: String!)
}

class LishCategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewConnect: UITableView!
    var delegate : categoryDelegate!
    var arrApp = ["newapplications","topfreeebooks","topmovies"]
    var arrLabel = ["App","Books","Movies"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConnect.separatorStyle = .None
        tableViewConnect.registerNib(UINib(nibName:"CategoryTableViewCell",bundle:  nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }
    
    //MARK: Table
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableViewConnect.dequeueReusableCellWithIdentifier("CategoryTableViewCell") as! CategoryTableViewCell
        cell.lbCategory.text = arrLabel[indexPath.section]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate.reloaddataCategory(arrApp[indexPath.section])
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Action
    @IBAction func backButtonClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
