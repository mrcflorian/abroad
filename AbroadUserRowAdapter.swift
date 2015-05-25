//
//  AbroadUserRowAdapter.swift
//  Abroad
//
//  Created by Florian Marcu on 5/19/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadUserRowAdapter: NLFTableRowAdapterProtocol {

    func tableView(tableView: UITableView, controller: UITableViewController, cellForRowAtIndexPath indexPath: NSIndexPath, object: AnyObject) -> UITableViewCell {
        let abroadUser = object as! AbroadUser
        let reuseIdentifier = "abroad.user.cell.identifier"

        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as! AbroadUserCell?
        if cell == nil {
            cell = AbroadUserCell(reuseIdentifier: reuseIdentifier)
        }
        dispatch_async(dispatch_get_main_queue()) {
            cell?.userTextView.text = abroadUser.fullName()
            cell?.userTextView.sizeToFit()
            cell?.userImageView.URLString = abroadUser.profileImageURL
        }
        return cell!
    }

    func tableView(tableView: UITableView, controller: UITableViewController, heightForRowAtIndexPath indexPath: NSIndexPath, object: AnyObject) -> CGFloat {
        return AbroadUserCell.height()
    }

}
