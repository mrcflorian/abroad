//
//  AbroadCommentTableViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 5/23/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadCommentTableViewController: NLFNucleusStreamifiedTableViewController
{
    var abroadStatus: AbroadPost? {
        didSet {
            self.stream = AbroadAPI.createCommentsStream(self.abroadStatus!)
        }
    }

    var commentRowAdapter = AbroadCommentRowAdapter()
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.use(commentRowAdapter, classRef: AbroadComment.self)
    }
}
