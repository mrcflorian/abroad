//
//  FacebookAPIManager.swift
//  Abroad
//
//  Created by Florian Marcu on 4/11/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

let kFacebookManagerDidFetchUserNotification = "kFacebookManagerDidFetchUserNotification"
let kFacebookManagerPermissions: [AnyObject] = ["email", "public_profile", "user_friends", "user_location"]

class FacebookAPIManager: NSObject {
    class func fetchDataForCurrentUser()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            if ((error) != nil) {
                println("Error: \(error)")
            } else {
                let params = ["facebook_id":result.valueForKey("id") as! NSString,
                    "email":result.valueForKey("email") as! NSString,
                    "firstname":result.valueForKey("name") as! NSString
                ]

                NSNotificationCenter.defaultCenter().postNotificationName(kFacebookManagerDidFetchUserNotification, object:params)
            }
        })
    }
}
