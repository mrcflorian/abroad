//
//  AbroadUser.swift
//  Abroad
//
//  Created by Florian Marcu on 4/11/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadUser: NSObject, NLFNucleusStreamableOject {
    var userID: String = ""
    var profileImageURL: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var longitude: String?
    var latitude: String?
    
    init(facebookID: String)
    {
        userID = AbroadUser.abroadID(facebookID)
    }

    init(jsonDictionary: NSDictionary)
    {
        if (jsonDictionary["user_id"] != nil) {
            userID = jsonDictionary["user_id"] as! String
        }
        if (jsonDictionary["profile_picture"] != nil) {
            profileImageURL = jsonDictionary["profile_picture"] as! String
        }
        if (jsonDictionary["firstname"] != nil) {
            firstName = jsonDictionary["firstname"] as! String
        }
        if (jsonDictionary["lastname"] != nil) {
            lastName = jsonDictionary["lastname"] as! String
        }
        if (jsonDictionary["latitude"] != nil) {
            latitude = jsonDictionary["latitude"] as? String
        }
        if (jsonDictionary["longitude"] != nil) {
            longitude = jsonDictionary["longitude"] as? String
        }
    }

    func fullName() -> String
    {
        return firstName + " " + lastName
    }

    func getId() -> String {
        return self.userID
    }

    class func abroadID(facebookID: String!) -> String
    {
        var repeatNo = 15 - count(facebookID)
        if repeatNo < 0 {
            repeatNo = 0
        }
        return "99" + facebookID;
    }
}
