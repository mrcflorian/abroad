//
//  AbroadStatusViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 5/25/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadStatusViewController: NLFNucleusViewController {

    var abroadStatusDetailsVC: AbroadStatusDetailsViewController?
    var abroadCommentTableVC: AbroadCommentTableViewController?

    var detailsSubview = UIView()
    var commentsSubview = UIView()

    var abroadDetailedStatus: AbroadDetailedStatus? {
        didSet {
            self.setup()
        }
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.abroadStatusDetailsVC = AbroadStatusDetailsViewController(coder: aDecoder)
        self.abroadCommentTableVC = AbroadCommentTableViewController(coder: aDecoder)
    }

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
    }

    override func viewDidLayoutSubviews() {
        self.detailsSubview.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + self.navigationController!.navigationBar.frame.height, self.view.frame.width, self.abroadStatusDetailsVC!.contentHeight())
        self.commentsSubview.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + self.abroadStatusDetailsVC!.contentHeight() + self.navigationController!.navigationBar.frame.height, self.view.frame.width, self.view.frame.height - self.abroadStatusDetailsVC!.contentHeight())
    }

    override func viewDidAppear(animated: Bool) {
        self.view.addSubview(detailsSubview)
        self.detailsSubview.addSubview(self.abroadStatusDetailsVC!.view)
        self.abroadStatusDetailsVC!.didMoveToParentViewController(self)

        self.view.addSubview(commentsSubview)

        self.commentsSubview.addSubview(self.abroadCommentTableVC!.view)
        self.abroadCommentTableVC!.didMoveToParentViewController(self)
    }

    func setup() {
        self.abroadStatusDetailsVC?.abroadDetailedStatus = self.abroadDetailedStatus
        self.abroadCommentTableVC?.abroadStatus = self.abroadDetailedStatus?.abroadStatus

        if (self.abroadStatusDetailsVC != nil) {
            self.addChildViewController(self.abroadStatusDetailsVC!)
        }

        if (self.abroadCommentTableVC != nil) {
            self.addChildViewController(self.abroadCommentTableVC!)
        }
    }

}
