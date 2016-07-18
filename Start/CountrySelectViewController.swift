//
//  CountrySelectViewController.swift
//  Start
//
//  Created by tran quoc Hung on 7/12/16.
//  Copyright © 2016 GMO-Z. All rights reserved.
//

import UIKit

 protocol CountryDelegate {
    func reloadData(country: String!)
}

class CountrySelectViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var delegate : CountryDelegate!
    
    @IBOutlet weak var tableViewConnect: UITableView!
    let arrCountry : [String] = ["vn","kr","pr"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.navigationBar.hidden = true
        tableViewConnect.delegate = self
        tableViewConnect.dataSource = self
        tableViewConnect.separatorStyle = .None
        tableViewConnect.registerNib(UINib(nibName:"CountryTableViewCell",bundle:  nil), forCellReuseIdentifier: "CountryTableViewCell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCountry.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableViewConnect.dequeueReusableCellWithIdentifier("CountryTableViewCell") as! CountryTableViewCell
        cell.imgCountry.image = UIImage(named: arrCountry[indexPath.row])
        cell.lbName.text = arrCountry[indexPath.row]
        
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        delegate.reloadData(arrCountry[indexPath.row])
        dismissViewControllerAnimated(true, completion: nil)
        
      
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
