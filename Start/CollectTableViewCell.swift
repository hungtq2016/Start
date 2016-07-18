//
//  CollectTableViewCell.swift
//  Start
//
//  Created by tran quoc Hung on 7/12/16.
//  Copyright © 2016 GMO-Z. All rights reserved.
//

import UIKit

class CollectTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAppIcon: UIImageView!
    @IBOutlet weak var btnActive: UIButton!
    @IBOutlet weak var lbAppName: UILabel!
    @IBOutlet weak var lbAppRight: UILabel!
    @IBOutlet weak var lbAppnumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnActive.layer.cornerRadius = 3
        btnActive.layer.borderWidth = 1.5
        btnActive.layer.borderColor = UIColor.grayColor().CGColor
    }
}
