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
            self.stream = AbroadAPI.createNewsFeedStream(self.user!)
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let chatRoomVC = AbroadChatRoomViewController(currentUser: user!, otherUser: user!)
        self.navigationController?.pushViewController(chatRoomVC, animated: true)
    }
}
