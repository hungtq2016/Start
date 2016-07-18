//
//  LishCategoryViewController.swift
//  Start
//
//  Created by tran quoc Hung on 7/12/16.
//  Copyright © 2016 GMO-Z. All rights reserved.
//

import UIKit

protocol categoryDelegate: NSObjectProtocol {
    func reloaddataCategory(category: String!)
}

class LishCategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableViewConnect: UITableView!
    
    var delegate : categoryDelegate!
    var newapplications = "newapplications"
    var topfreeebooks =  "topfreeebooks"
    var topmovies = "topmovies"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        tableViewConnect.dataSource = self
        tableViewConnect.delegate = self
        tableViewConnect.separatorStyle = .None
        tableViewConnect.registerNib(UINib(nibName:"CategoryTableViewCell",bundle:  nil), forCellReuseIdentifier: "CategoryTableViewCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableViewConnect.dequeueReusableCellWithIdentifier("CategoryTableViewCell") as! CategoryTableViewCell
        
        if indexPath.section == 0 {
            cell.lbCategory.text = "App"
        }else if indexPath.section == 1 {
            cell.lbCategory.text = "Books"
        }else {
            cell.lbCategory.text = "Movies"
        }
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0  {
            delegate.reloaddataCategory(newapplications)
        }else if indexPath.section == 1{
            delegate.reloaddataCategory(topfreeebooks)
        }else{
            delegate.reloaddataCategory(topmovies)
        }
        
        dismissViewControllerAnimated(true, completion: nil)
//        delegate.reloaddataCategory("\(indexPath.row)")
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Action
    
    @IBAction func backButtonClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
