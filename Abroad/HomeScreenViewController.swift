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
                self.newsFeedVC?.stream = AbroadAPI.createNewsFeedStream(user!)
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "newsFeedVCSegue") {
            if (newsFeedVC == nil && user != nil) {
                newsFeedVC = segue.destinationViewController as? AbroadTableViewController
                self.newsFeedVC?.stream = AbroadAPI.createNewsFeedStream(user!)
            } else {
                newsFeedVC = segue.destinationViewController as? AbroadTableViewController
            }
        }
    }
}
