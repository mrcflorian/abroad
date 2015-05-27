//
//  MessagesScreenViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 4/9/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class MessagesScreenViewController: NLFNucleusViewController {
    var user: AbroadUser?

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "presentMessageTableVC") {
            let messageTableVC = segue.destinationViewController as! AbroadMessageTableViewController
            messageTableVC.user = user
        }
    }
}
