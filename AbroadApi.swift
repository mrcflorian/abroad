//
//  AbroadAPI.swift
//  Abroad
//
//  Created by Florian Marcu on 4/11/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadAPI: NSObject {
    class func requestLikes(userID: String, completionHandler: ((Array<AbroadSong>) -> Void)?)
    {
        let params = ["user_id":userID]
        let request = NLFNucleusAPIRequest(params:params, path:"likes.php")
        NLFNucleusAPI.request(request) {(data, response, error) in
            if completionHandler != nil {
                var songsList = Array<AbroadSong>()
                var likesArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! Array<NSDictionary>
                for jsonDictionary in likesArray {
                    songsList.append(AbroadSong(jsonDictionary: jsonDictionary))
                }
                completionHandler!(songsList)
            }
        }
    }

    class func requestUser(email: String, completionHandler: ((AbroadUser) -> Void)?)
    {
        let params = ["email":email]
        let request = NLFNucleusAPIRequest(params:params, path:"user.php")
        NLFNucleusAPI.request(request) {(data, response, error) in
            if (completionHandler != nil) {
                var songsList = Array<AbroadSong>()
                var jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary
                if (jsonDictionary != nil) {
                    completionHandler!(AbroadUser(jsonDictionary: jsonDictionary!))
                }
            }
        }
    }
}
