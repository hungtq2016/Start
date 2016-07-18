//
//  Entry.swift
//  Start
//
//  Created by tran quoc Hung on 7/13/16.
//  Copyright © 2016 GMO-Z. All rights reserved.
//

import Foundation
import SwiftyJSON

class App {
    var name,right,price,image,artist,title,link,id,contentType: String?
    var category : [Int]?
    static func createData(dict: JSON) -> App {
        let app: App = App()
        app.name = dict["im:name"]["label"].string
        app.right = dict["im:artist"]["label"].string
        app.image = dict["im:image"][2]["label"].string
        app.id = dict["id"]["attributes"]["im:id"].string
        return app
    }
    
}