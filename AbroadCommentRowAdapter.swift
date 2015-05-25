//
//  AbroadCommentRowAdapter.swift
//  Abroad
//
//  Created by Florian Marcu on 5/23/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadCommentRowAdapter: NLFTableRowAdapterProtocol {
    func tableView(tableView: UITableView, controller: UITableViewController, cellForRowAtIndexPath indexPath: NSIndexPath, object: AnyObject) -> UITableViewCell {
        let abroadComment = object as! AbroadComment
        let reuseIdentifier = "abroad.comment.cell.identifier"

        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as! AbroadCommentCell?
        if cell == nil {
            cell = AbroadCommentCell(reuseIdentifier: reuseIdentifier)
        }
        dispatch_async(dispatch_get_main_queue()) {
            cell?.commentTextView.text = abroadComment.text
            cell?.commentTextView.sizeToFit()
            cell?.commentImageView.URLString = abroadComment.imageURL
        }
        return cell!
    }

    func tableView(tableView: UITableView, controller: UITableViewController, heightForRowAtIndexPath indexPath: NSIndexPath, object: AnyObject) -> CGFloat {
        return AbroadCommentCell.height()
    }
}
