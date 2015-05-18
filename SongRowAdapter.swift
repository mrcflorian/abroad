//
//  SongRowAdapter.swift
//  Abroad
//
//  Created by Florian Marcu on 4/12/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class SongRowAdapter: NLFTableRowAdapterProtocol
{
    var x: Int = 10
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: AnyObject) -> UITableViewCell {
        if !object.isKindOfClass(AbroadPost) {
            return UITableViewCell()
        }
        let abroadSong = object as! AbroadPost
        let reuseIdentifier = "abroad.song.cell.identifier"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as! AbroadSongCell?
        if cell == nil {
            cell = AbroadSongCell(reuseIdentifier: reuseIdentifier)
        }
        dispatch_async(dispatch_get_main_queue()) {
            cell?.songTextView.text = abroadSong.title
            cell?.songTextView.sizeToFit()
            cell?.songImageView.URLString = abroadSong.photoURL
        }
        return cell!
    }
}
