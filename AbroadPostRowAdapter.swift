//
//  SongRowAdapter.swift
//  Abroad
//
//  Created by Florian Marcu on 4/12/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadPostRowAdapter: NLFTableRowAdapterProtocol
{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: AnyObject) -> UITableViewCell {
        if !object.isKindOfClass(AbroadPost) {
            return UITableViewCell()
        }
        let abroadSong = object as! AbroadPost
        let reuseIdentifier = "abroad.post.cell.identifier"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as! AbroadPostCell?
        if cell == nil {
            cell = AbroadPostCell(reuseIdentifier: reuseIdentifier)
        }
        dispatch_async(dispatch_get_main_queue()) {
            cell?.postTextView.text = abroadSong.title
            cell?.postTextView.sizeToFit()
            cell?.postImageView.URLString = abroadSong.photoURL
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath, object: AnyObject) -> CGFloat {
        return AbroadPostCell.height()
    }
}
