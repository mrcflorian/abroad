//
//  AbroadComment.swift
//  Abroad
//
//  Created by Florian Marcu on 5/23/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import UIKit

class AbroadComment: NSObject {
    var userID: String = ""
    var text: String = ""
    var imageURL: String = ""

    init(facebookID: String)
    {
        userID = AbroadUser.abroadID(facebookID)
    }

    init(jsonDictionary: NSDictionary)
    {
        if (jsonDictionary["hkid"] != nil) {
            userID = jsonDictionary["hkid"] as! String
        }
        if (jsonDictionary["title"] != nil) {
            text = jsonDictionary["title"] as! String
        }
        if (jsonDictionary["content"] != nil) {
            imageURL = jsonDictionary["content"] as! String
        }
    }
}
