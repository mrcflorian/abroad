//
//  MessagesScreenViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 4/9/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class MessagesScreenViewController: NLFNucleusViewController {
    var messagesVC: AbroadTableViewController?

    override func viewDidLoad() {
        self.messagesVC?.tableView.reloadData()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "messagesVC") {
            messagesVC = segue.destinationViewController as? AbroadTableViewController
            mockData()
        }
    }
    
    func mockData()
    {
        AbroadAPI.requestUser("florian.mrc@gmail.com", completionHandler: { (user) -> Void in
            self.messagesVC?.objectsArray = [user, user, user, user, user]
            self.messagesVC?.tableView.reloadData()
        })
    }
}
