
//  DetailViewController.swift
//  Start
//
//  Created by tran quoc Hung on 7/12/16.
//  Copyright © 2016 GMO-Z. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import SwiftyJSON

class DetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView1: UIScrollView!
    @IBOutlet weak var lbAppName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var ImgScreenShort1: UIImageView!
    @IBOutlet weak var imgScreenShort3: UIImageView!
    @IBOutlet weak var lbAppDev: UILabel!
    @IBOutlet weak var imgScreenShort2: UIImageView!
    @IBOutlet weak var imgAppIcon: UIImageView!
    var detail : Detail = Detail()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
    }
    
    func loadDataForDetail(urlId: String!) {
        let url = url_detail_vc + urlId
        Alamofire.request(.GET, url).validate().responseJSON{ response in
            if response.result.isSuccess {
                let json = JSON(data: response.data!)
                if let results = json["results"].array {
                    self.detail = Detail.creatData(results.first! as JSON)
                    self.loadingView(self.detail)
                }
                
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
        }
    }
    
    @IBAction func backButtonClick(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
        self.navigationController?.navigationBar.hidden = false
    }
}
