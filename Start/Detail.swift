//
//  Detail.swift
//  Start
//
//  Created by tran quoc Hung on 7/15/16.
//  Copyright © 2016 GMO-Z. All rights reserved.
//

import Foundation

class Detail {
    var artworkUrl100,screenshotUrls1,screenshotUrls2,screenshotUrls3,trackCensoredName,description,artistName : String!
    
    static func creatData(dict: NSDictionary) -> Detail {
        let detail : Detail = Detail()
        
        detail.artistName = dict.valueForKey("artistName") as? String
//        print(detail.artistName)
        detail.artworkUrl100 = dict.valueForKey("artworkUrl100") as? String
        let arrScreen = dict.valueForKey("screenshotUrls") as? NSMutableArray
        if ( arrScreen != nil ){
            
        detail.screenshotUrls1 = arrScreen?.objectAtIndex(0) as? String
        detail.screenshotUrls2 = arrScreen?.objectAtIndex(1) as? String
//        detail.screenshotUrls3 = arrScreen?.objectAtIndex(2) as? String
        }
        detail.trackCensoredName = dict.valueForKey("trackCensoredName") as? String
        detail.description = dict.valueForKey("description") as? String
        
        
        
        
        
        return detail
    }
    }