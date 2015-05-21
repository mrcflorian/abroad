//
//  HomeScreenViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 4/9/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class HomeScreenViewController: NLFNucleusViewController {
    
    var newsFeedVC: AbroadTableViewController?
    var user: AbroadUser? {
        didSet {
            if (user != nil) {
                AbroadAPI.requestLikes(user!.userID, completionHandler: { (postsList) -> Void in
                    self.newsFeedVC?.objectsArray = postsList
                    self.newsFeedVC?.tableView.reloadData()
                })
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "newsFeedVCSegue") {
            newsFeedVC = segue.destinationViewController as? AbroadTableViewController
        }
    }
}
