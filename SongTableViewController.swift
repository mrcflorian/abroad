//
//  SongTableViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 4/12/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework
import UIKit

class SongTableViewController: NLFNucleusTableViewController
{
    var songsArray: Array<AbroadSong>?
    var rowAdapter = SongRowAdapter()

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.use(rowAdapter, classRef: AbroadSong.self)
    }

    var songs: Array<AbroadSong>?
    {
        set {
            songsArray = newValue
            self.songsListDidUpdate()
        }
        get {
            return songsArray
        }
    }
    
    func songsListDidUpdate()
    {
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (songsArray != nil) {
            return songsArray!.count
        }
        return 0
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func objects() -> [AnyObject] {
        if (songsArray == nil) {
            return []
        }
        return songsArray!
    }
}
