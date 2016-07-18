//
//  Detail.swift
//  Start
//
//  Created by tran quoc Hung on 7/15/16.
//  Copyright © 2016 GMO-Z. All rights reserved.
//

import Foundation
import SwiftyJSON

class Detail {
    var artworkUrl100,screenshotUrls1,screenshotUrls2,screenshotUrls3,trackCensoredName,description,artistName : String!
    static func creatData(dict: JSON) -> Detail {
        let detail : Detail = Detail()
        detail.artistName = dict["artistName"].string
        detail.artworkUrl100 = dict["artworkUrl100"].string
        detail.trackCensoredName = dict["trackCensoredName"].string
        detail.description = dict["description"].string
        detail.screenshotUrls1 = dict["screenshotUrls"][0].string
        detail.screenshotUrls2 = dict["screenshotUrls"][1].string
        return detail
    }
}