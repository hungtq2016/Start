//
//  Entry.swift
//  Start
//
//  Created by tran quoc Hung on 7/13/16.
//  Copyright © 2016 GMO-Z. All rights reserved.
//

import Foundation

class App {
    var name,right,price,image,artist,title,link,id,contentType: String?
    var category : [Int]?
    
    
    static func createData(dict: NSDictionary) -> App {
        let app: App = App()
        
        var dictt  = dict.valueForKey("im:name") as! NSDictionary
        app.name = dictt.valueForKey("label") as? String
        
        dictt = dict.valueForKey("im:artist") as! NSDictionary
        app.right = dictt.valueForKey("label") as? String
        
        let image = dict.valueForKey("im:image") as! NSArray
        let ima = image.lastObject as? NSDictionary
        app.image = ima!.valueForKey("label") as? String
        
        
        let detailId = dict.valueForKey("id") as! NSDictionary
        let id = detailId.valueForKey("attributes") as! NSDictionary
        app.id = id.valueForKey("im:id") as? String
        

        
        
        return app
    }
    
}