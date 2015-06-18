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

    class func updateUser(params: Dictionary <String, String>?, completionHandler: ((AbroadUser) -> Void)?)
    {
        let request = NLFNucleusAPIRequest(params: params, path:"user/update")
        NLFNucleusAPI.request(request) {(data, response, error) in
            if (completionHandler != nil) {
                var errorTmp: NSError?
                var jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &errorTmp) as? NSDictionary
                if (jsonDictionary != nil) {
                    completionHandler!(AbroadUser(jsonDictionary: jsonDictionary!))
                }
            }
        }
    }

    class func createNewsFeedStream(user: AbroadUser) -> NLFNucleusStream
    {
        let request = NLFNucleusAPIRequest(params:["user_id":user.userID], path:"newsfeed")
        return NLFNucleusStream(apiRequest: request, jsonDecoder: AbroadPostJSONDecoder())
    }

    class func createMessagingUsersStream(user: AbroadUser) -> NLFNucleusStream
    {
        let request = NLFNucleusAPIRequest(params:["user_id":user.userID], path:"users/messagingUsers")
        return NLFNucleusStream(apiRequest: request, jsonDecoder: AbroadUserJSONDecoder())
    }

    class func createProfileStream(user: AbroadUser) -> NLFNucleusStream
    {
        let request = NLFNucleusAPIRequest(params:["user_id":user.userID], path:"profile")
        return NLFNucleusStream(apiRequest: request, jsonDecoder: AbroadPostJSONDecoder())
    }

    class func createCommentsStream(status: AbroadPost) -> NLFNucleusStream
    {
        let request = NLFNucleusAPIRequest(params:["status_id":status.statusID], path:"comments")
        return NLFNucleusStream(apiRequest: request, jsonDecoder: AbroadCommentJSONDecoder())
    }

    class func addStatus(userID: String, textValue: String, completionHandler: (() -> Void)?) {
        let params = ["user_id":userID, "status":textValue]
        let request = NLFNucleusAPIRequest(params:params, path:"addStatus")
        NLFNucleusAPI.request(request) {(data, response, error) in
            if completionHandler != nil {
                //var abroadPost = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! AbroadPost
                completionHandler!()
            }
        }
    }

    class func addComment(userID: String, statusID: String, textValue: String, completionHandler: (() -> Void)?) {
        let params = ["user_id":userID, "status_id":statusID, "comment":textValue]
        let request = NLFNucleusAPIRequest(params:params, path:"addComment")
        NLFNucleusAPI.request(request) {(data, response, error) in
            if completionHandler != nil {
                //var abroadPost = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! AbroadPost
                completionHandler!()
            }
        }
    }

    class func like(userID: String, statusID: String, completionHandler: (() -> Void)?) {
        let params = ["user_id":userID, "status_id":statusID]
        let request = NLFNucleusAPIRequest(params:params, path:"like.php")
        NLFNucleusAPI.request(request) {(data, response, error) in
            if completionHandler != nil {
                completionHandler!()
            }
        }
    }
}
