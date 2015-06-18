//
//  AbroadComment.swift
//  Abroad
//
//  Created by Florian Marcu on 5/23/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadComment: NSObject, NLFNucleusStreamableOject {
    var userID: String = ""
    var text: String = ""
    var imageURL: String = ""
    var createdAt: String = ""

    init(facebookID: String)
    {
        userID = AbroadUser.abroadID(facebookID)
    }

    init(jsonDictionary: NSDictionary)
    {
        if (jsonDictionary["user_id"] != nil) {
            userID = jsonDictionary["user_id"] as! String
        }
        if (jsonDictionary["text"] != nil) {
            text = jsonDictionary["text"] as! String
        }
        if (jsonDictionary["image_url"] != nil) {
            text = jsonDictionary["image_url"] as! String
        }
        if (jsonDictionary["created_at"] != nil) {
            imageURL = jsonDictionary["profile_picture"] as! String
        }
    }

    func getId() -> String {
        return userID + createdAt
    }
}
