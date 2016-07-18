//
//  ViewController.swift
//  Start
//
//  Created by tran quoc Hung on 7/12/16.
//  Copyright © 2016 GMO-Z. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var btnCountry: UIButton!
    @IBOutlet weak var tableViewConnect: UITableView!
    var arrayApps : NSMutableArray? = NSMutableArray()
    var country1 = "us"
    var category1 = "newapplications"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConnect.separatorStyle = .None
        tableViewConnect.registerNib(UINib(nibName:"CollectTableViewCell",bundle:  nil), forCellReuseIdentifier: "CollectTableViewCell")
        getData(country1, category: category1)
    }
    
    // MARK: - Table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrayApps?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableViewConnect.dequeueReusableCellWithIdentifier("CollectTableViewCell",forIndexPath: indexPath) as! CollectTableViewCell
        let entry: App = (arrayApps?.objectAtIndex(indexPath.row) ) as! App
        cell.lbAppName.text = entry.name
        cell.lbAppRight.text = entry.right
        cell.lbAppnumber.text = "\(indexPath.row + 1 )"
        cell.imgAppIcon.layer.cornerRadius = 20
        if entry.image != nil {
            cell.imgAppIcon.sd_setImageWithURL(NSURL(string: entry.image!), placeholderImage: UIImage(named: "no-image"),options: SDWebImageOptions.HighPriority)
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let newvc : DetailViewController = DetailViewController.init(nibName:"DetailViewController",bundle:  nil)
        let entry: App = (arrayApps?.objectAtIndex(indexPath.row) ) as! App
        newvc.loadDataForDetail(entry.id)
        navigationController?.pushViewController(newvc, animated: true)
    }
    
    // MARK: - Function
    func getData(country: String!, category: String!) {
        let url = url_first + country + url_between + category + url_last
        Alamofire.request(.GET, url).validate().responseJSON{ response in
            if response.result.isSuccess {
                self.arrayApps = NSMutableArray()
                if let dataJson = try? NSJSONSerialization.JSONObjectWithData(response.data!, options: .AllowFragments) {
                    let feed = dataJson.valueForKey("feed") as! NSDictionary
                    let entry = feed.valueForKey("entry") as! NSArray
                    for dict in entry {
                        let app = App.createData(dict as! NSDictionary)
                        self.arrayApps?.addObject(app)
                    }
                    self.tableViewConnect.reloadData()
                    print("geting data . . . .")
                }
            }
        }
    }
    
    // MARK: - Action
    @IBAction func countryClick(sender: UIButton) {
        let newvc  : CountrySelectViewController = CountrySelectViewController.init(nibName:"CountrySelectViewController",bundle: nil)
        newvc.delegate = self
        self.presentViewController(newvc, animated: true, completion: nil)
    }
    
    @IBAction func categoryClick(sender: UIButton) {
        let newvc  : LishCategoryViewController = LishCategoryViewController.init(nibName:"LishCategoryViewController",bundle: nil)
        newvc.delegate = self
        presentViewController(newvc, animated: true, completion: nil)
    }
    
}

//MARK: - Extension HomeVC
extension HomeViewController: CountryDelegate, categoryDelegate { 
    func reloadData(country: String!) {
        country1 = country
        getData(country, category: category1)
        btnCountry.imageView?.image = UIImage(named: country)
    }
    func reloaddataCategory(category: String!) {
        category1 = category
        getData(country1, category: category)
        
    }
}
