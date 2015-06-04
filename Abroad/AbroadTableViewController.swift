//
//  AbroadTableViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 5/18/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadTableViewController: NLFNucleusStreamifiedTableViewController
{
    var userRowAdapter = AbroadUserRowAdapter()
    var postRowAdapter = AbroadPostRowAdapter()
    var lastSelectedObject: AnyObject?

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.use(userRowAdapter, classRef: AbroadUser.self)
        self.use(postRowAdapter, classRef: AbroadPost.self)
        self.tableView.separatorColor = UIColor.clearColor()
        self.hasPullToRefreshSupport = true
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.lastSelectedObject = self.objects()[indexPath.row]
        self.performSegueWithIdentifier("showStatusDetailsVCSegue", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showStatusDetailsVCSegue") {
            let statusVC = segue.destinationViewController as? AbroadStatusViewController
            let abroadStatus = (sender as! AbroadTableViewController).lastSelectedObject as! AbroadPost
            let abroadUser = AbroadUser(facebookID: "sdsa")
            abroadUser.profileImageURL = abroadStatus.photoURL
            statusVC!.abroadDetailedStatus = AbroadDetailedStatus(abroadUser: abroadUser, abroadStatus: abroadStatus)
            statusVC!.navigationItem.title = abroadStatus.title
        }
    }
}
