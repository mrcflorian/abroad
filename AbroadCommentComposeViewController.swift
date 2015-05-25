//
//  AbroadCommentComposeViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 5/25/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadCommentComposeViewController: NLFNucleusFormTableViewController {

    override init(formCells: [NLFNucleusFormTableViewCell]) {
        super.init(formCells: formCells)
        self.tableView.tableHeaderView = UIView(frame:CGRectMake(0.0, 0.0, self.tableView.bounds.size.width, 0.01))
        self.automaticallyAdjustsScrollViewInsets = false
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func contentHeight() -> CGFloat {
        return self.tableView.contentSize.height
    }

    override func didMoveToParentViewController(parent: UIViewController?) {
        self.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
    }

}
