//
//  AbroadAPI.swift
//  Abroad
//
//  Created by Florian Marcu on 4/11/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadAPI: NSObject {
    class func requestLikes(userID: String, completionHandler: ((Array<AbroadPost>) -> Void)?)
    {
        let params = ["user_id":userID]
        let request = NLFNucleusAPIRequest(params:params, path:"likes.php")
        NLFNucleusAPI.request(request) {(data, response, error) in
            if completionHandler != nil {
                var songsList = Array<AbroadPost>()
                var likesArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! Array<NSDictionary>
                for jsonDictionary in likesArray {
                    songsList.append(AbroadPost(jsonDictionary: jsonDictionary))
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
                var songsList = Array<AbroadPost>()
                var jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary
                if (jsonDictionary != nil) {
                    completionHandler!(AbroadUser(jsonDictionary: jsonDictionary!))
                }
            }
        }
    }

    class func createNewsFeedStream(user: AbroadUser) -> NLFNucleusStream
    {
        let request = NLFNucleusAPIRequest(params:["user_id":user.userID], path:"likes.php")
        return NLFNucleusStream(apiRequest: request, jsonDecoder: AbroadPostJSONDecoder())
    }

    class func createCommentsStream(status: AbroadPost) -> NLFNucleusStream
    {
        let request = NLFNucleusAPIRequest(params:["user_id":"99100000181006895"], path:"likes.php")
        return NLFNucleusStream(apiRequest: request, jsonDecoder: AbroadCommentJSONDecoder())
    }

    class func addStatus(userID: String, textValue: String, completionHandler: ((AbroadPost) -> Void)?) {
        let params = ["user_id":userID, "status":textValue]
        let request = NLFNucleusAPIRequest(params:params, path:"addStatus.php")
        NLFNucleusAPI.request(request) {(data, response, error) in
            if completionHandler != nil {
                var abroadPost = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! AbroadPost
                completionHandler!(abroadPost)
            }
        }
    }

}
