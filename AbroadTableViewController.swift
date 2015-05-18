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
    var userRowAdapter = SongRowAdapter()
    var postRowAdapter = SongRowAdapter()

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.use(userRowAdapter, classRef: AbroadUser.self)
        self.use(postRowAdapter, classRef: AbroadPost.self)
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.redColor()
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
