//
//  ProfileScreenViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 6/8/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class ProfileScreenViewController: NLFNucleusViewController {

    var statusesVC: AbroadTableViewController?
    var user: AbroadUser? {
        didSet {
            if (user != nil) {
                self.statusesVC?.stream = AbroadAPI.createProfileStream(user!)
                self.statusesVC?.stream?.loadMore()
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "presentProfileVCSegue") {
            if (statusesVC == nil && user != nil) {
                statusesVC = segue.destinationViewController as? AbroadTableViewController
                self.statusesVC?.shouldBeHacked = true
                self.statusesVC?.stream = AbroadAPI.createProfileStream(user!)
                self.statusesVC?.stream?.loadTop()
            } else {
                statusesVC = segue.destinationViewController as? AbroadTableViewController
            }
        }
    }

}
