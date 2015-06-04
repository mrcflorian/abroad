//
//  AbroadPost.swift
//  Abroad
//
//  Created by Florian Marcu on 4/11/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadPost: NSObject, NLFNucleusStreamableOject
{
    var statusID: String
    var photoURL: String
    var userID: String
    var title: String
    var createdAt: String

    init(jsonDictionary: NSDictionary)
    {
        statusID = jsonDictionary["status_id"] as! String
        userID = jsonDictionary["user_id"] as! String
        photoURL = jsonDictionary["image_url"] as! String
        title = jsonDictionary["status"] as! String
        createdAt = jsonDictionary["created_at"] as! String
    }

    func getId() -> String {
        return self.statusID
    }
}
