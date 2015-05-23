//
//  AbroadDetailedStatusRowAdapter.swift
//  Abroad
//
//  Created by Florian Marcu on 5/23/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadDetailedStatusRowAdapter: NLFTableRowAdapterProtocol
{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: AnyObject) -> UITableViewCell {
        let abroadDetailedStatus = object as! AbroadDetailedStatus
        let reuseIdentifier = "abroad.detailed.status.cell.identifier"

        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as! AbroadDetailedStatusCell?
        if cell == nil {
            cell = AbroadDetailedStatusCell(reuseIdentifier: reuseIdentifier)
        }
        dispatch_async(dispatch_get_main_queue()) {
            cell?.statusTextView.text = abroadDetailedStatus.abroadStatus.title
            cell?.statusTextView.sizeToFit()
            if (abroadDetailedStatus.abroadUser != nil) {
                cell?.authorImageView.URLString = abroadDetailedStatus.abroadUser!.profileImageURL
            }
        }
        return cell!
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath, object: AnyObject) -> CGFloat {
        return AbroadDetailedStatusCell.height()
    }
}
