//
//  AbroadMessageTableViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 5/27/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadMessageTableViewController: NLFNucleusStreamifiedTableViewController {
    var user: AbroadUser? {
        didSet {
            self.stream = AbroadAPI.createMessagingUsersStream(self.user!)
            self.stream?.loadMore()
        }
    }

    var userRowAdapter = AbroadUserRowAdapter()
    var postRowAdapter = AbroadPostRowAdapter()

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.use(userRowAdapter, classRef: AbroadUser.self)
        self.use(postRowAdapter, classRef: AbroadPost.self)
        self.tableView.separatorColor = UIColor.clearColor()
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let otherUser = self.objects()[indexPath.row] as? AbroadUser {
            let chatRoomVC = AbroadChatRoomViewController(currentUser: user!, otherUser: otherUser)
            self.navigationController?.pushViewController(chatRoomVC, animated: true)
        }
    }
}
