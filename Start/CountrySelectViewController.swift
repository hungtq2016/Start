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
    
    @IBOutlet weak var tableViewConnect: UITableView!
    var delegate : CountryDelegate!
    let arrCountry : [String] = ["vn","kr","pr"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConnect.separatorStyle = .None
        tableViewConnect.registerNib(UINib(nibName:"CountryTableViewCell",bundle:  nil), forCellReuseIdentifier: "CountryTableViewCell")
    }
    
    // MARK: - Table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCountry.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableViewConnect.dequeueReusableCellWithIdentifier("CountryTableViewCell") as! CountryTableViewCell
        cell.imgCountry.image = UIImage(named: arrCountry[indexPath.row])
        cell.lbName.text = arrCountry[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate.reloadData(arrCountry[indexPath.row])
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Action
    @IBAction func backButtonClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
