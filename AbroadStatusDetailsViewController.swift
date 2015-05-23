//
//  AbroadStatusDetailsViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 5/23/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadStatusDetailsViewController: NLFNucleusTableViewController
{
    var detailedStatusRowAdapter = AbroadDetailedStatusRowAdapter()

    var abroadDetailedStatus: AbroadDetailedStatus? {
        didSet {
            self.setup()
        }
    }
    var commentsVC: AbroadCommentTableViewController?

    required init (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.use(detailedStatusRowAdapter, classRef: AbroadDetailedStatus.self)
        self.tableView.separatorColor = UIColor.clearColor()
    }

    func setup() {
        if (abroadDetailedStatus != nil) {
            self.addItem(abroadDetailedStatus!)
        }
    }
}
