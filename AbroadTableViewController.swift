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
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.lastSelectedObject = self.objects()[indexPath.row]
        self.performSegueWithIdentifier("showStatusDetailsVCSegue", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showStatusDetailsVCSegue") {
            let statusDetailsVC = segue.destinationViewController as? AbroadStatusDetailsViewController
            let abroadStatus = (sender as! AbroadTableViewController).lastSelectedObject as! AbroadPost
            let abroadUser = AbroadUser(facebookID: "sdsa")
            abroadUser.profileImageURL = abroadStatus.photoURL
            statusDetailsVC!.abroadDetailedStatus = AbroadDetailedStatus(abroadUser: abroadUser, abroadStatus: abroadStatus)
            statusDetailsVC!.navigationItem.title = abroadStatus.title
        }
    }
}
