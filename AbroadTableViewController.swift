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

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.use(userRowAdapter, classRef: AbroadUser.self)
        self.use(postRowAdapter, classRef: AbroadPost.self)
        self.tableView.separatorColor = UIColor.clearColor()
    }
}
