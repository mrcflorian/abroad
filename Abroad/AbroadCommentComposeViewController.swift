//
//  AbroadCommentComposeViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 5/25/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadCommentComposeViewController: NLFNucleusFormTableViewController {
    var abroadDetailedStatus: AbroadDetailedStatus?

    override init(formCells: [NLFNucleusFormTableViewCell]) {
        super.init(formCells: formCells)
        self.tableView.tableHeaderView = UIView(frame:CGRectMake(0.0, 0.0, self.tableView.bounds.size.width, 0.01))
        self.automaticallyAdjustsScrollViewInsets = false
        (self.cellsArray!.first as! NLFNucleusComposeCommentFormCell).addTarget(self, postingAction: "didTapCommentButton:")
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

    func didTapCommentButton(sender: AnyObject) {
        let textCell = (self.cellsArray!.first as! NLFNucleusComposeCommentFormCell)
        let statusText = textCell.textValue()
        if (count(statusText) > 0 && self.abroadDetailedStatus != nil) {
            AbroadAPI.addComment(self.abroadDetailedStatus!.abroadUser.userID, statusID: self.abroadDetailedStatus!.abroadStatus.statusID, textValue: statusText, completionHandler: {
                dispatch_async(dispatch_get_main_queue()) {
                    let commentsListVC = (self.parentViewController as! AbroadStatusViewController).abroadCommentTableVC
                    commentsListVC.update()
                    textCell.resetValue()
                }
            })
        }
    }
}
