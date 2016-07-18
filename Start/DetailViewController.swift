
//  DetailViewController.swift
//  Start
//
//  Created by tran quoc Hung on 7/12/16.
//  Copyright © 2016 GMO-Z. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var scrollView1: UIScrollView!
    @IBOutlet weak var lbAppName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var ImgScreenShort1: UIImageView!
    @IBOutlet weak var imgScreenShort3: UIImageView!
    @IBOutlet weak var lbAppDev: UILabel!
    var url_id : String!
    @IBOutlet weak var imgScreenShort2: UIImageView!
    @IBOutlet weak var imgAppIcon: UIImageView!
    var detail : Detail = Detail()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(url_id)
        self.navigationController?.navigationBar.hidden = true
//        scrollView1.contentInset = UIEdgeInsetsMake(0, 0, 500, 0)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadDataForDetail(urlId: String!) {
        let url = url_detail_vc + urlId
        print(url)
        Alamofire.request(.GET, url).validate().responseJSON{ response in
            if response.result.isSuccess {
                
                let dataJson = try? NSJSONSerialization.JSONObjectWithData(response.data!, options: .AllowFragments)
                
                if dataJson != nil {
                    let results = dataJson?.valueForKey("results") as! NSMutableArray
                    self.detail = Detail()
                    self.detail = Detail.creatData(results.firstObject as! NSDictionary)
                    print(self.detail.artistName)
                    self.loadingView(self.detail)
                    }
                
                    print("loading view . . . .")
                
                }
            }
        }
    func loadingView(detail: Detail) {
        lbAppName.text = detail.artistName
        lbAppDev.text =  detail.trackCensoredName
        lbDescription.text = detail.description
        imgAppIcon.sd_setImageWithURL(NSURL(string: detail.artworkUrl100), placeholderImage: UIImage(named: "no-image"), options: SDWebImageOptions.HighPriority)
        if detail.screenshotUrls1 != nil  {
            ImgScreenShort1.sd_setImageWithURL(NSURL(string: detail.screenshotUrls1), placeholderImage: UIImage(named: "no-image"), options: SDWebImageOptions.HighPriority)
            imgScreenShort2.sd_setImageWithURL(NSURL(string: detail.screenshotUrls2), placeholderImage: UIImage(named: "no-image"), options: SDWebImageOptions.HighPriority)
//            imgScreenShort3.sd_setImageWithURL(NSURL(string: detail.screenshotUrls3), placeholderImage: UIImage(named: "no-image"), options: SDWebImageOptions.HighPriority)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backButtonClick(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
            self.navigationController?.navigationBar.hidden = false
        
    }

}