//
//  HomeScreenViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 4/9/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class HomeScreenViewController: NLFNucleusViewController {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didFetchFacebookUser:", name: kFacebookManagerDidFetchUserNotification, object: nil)
        FacebookAPIManager.startFetchingDataForCurrentUser()
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: kFacebookManagerDidFetchUserNotification, object: nil)
    }
    
    func didFetchFacebookUser(notification: NSNotification)
    {
        AbroadAPI.requestUser(notification.object as! String, completionHandler: { (user) -> Void in
            AbroadAPI.requestLikes(user.userID, completionHandler: { (songsList) -> Void in
            })
        })
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "") {
        }
    }
}
