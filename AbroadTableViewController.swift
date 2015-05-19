//
//  AbroadTableViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 5/18/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadTableViewController: NLFNucleusTableViewController {

    var objectsArray: Array<AbroadPost>?
    var userRowAdapter = AbroadPostRowAdapter()
    var postRowAdapter = AbroadPostRowAdapter()

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.use(userRowAdapter, classRef: AbroadUser.self)
        self.use(postRowAdapter, classRef: AbroadPost.self)
        self.tableView.separatorColor = UIColor.clearColor()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (objectsArray != nil) {
            return objectsArray!.count
        }
        return 0
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func objects() -> [AnyObject] {
        if (objectsArray == nil) {
            return []
        }
        return objectsArray!
    }

}
