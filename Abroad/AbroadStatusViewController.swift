//
//  AbroadStatusViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 5/25/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework
import QuartzCore
import Foundation
import UIKit

let kCommentComposerBorderWidth: CGFloat = 2.0
let kCommentComposerBorderColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
let kStatusDetailsVerticalSpacing: CGFloat = 20.0

class AbroadStatusViewController: NLFNucleusViewController {

    var abroadStatusDetailsVC: AbroadStatusDetailsViewController
    var abroadCommentTableVC: AbroadCommentTableViewController
    var abroadCommentComposeVC: AbroadCommentComposeViewController

    var detailsSubview = UIView()
    var composeTopBorderView = UIView()
    var commentsSubview = UIView()
    var composeBottomBorderView = UIView()
    var commentComposerSubiew = UIView()

    var abroadDetailedStatus: AbroadDetailedStatus? {
        didSet {
            self.setup()
        }
    }

    required init(coder aDecoder: NSCoder) {
        self.abroadStatusDetailsVC = AbroadStatusDetailsViewController(coder: aDecoder)
        self.abroadCommentTableVC = AbroadCommentTableViewController(coder: aDecoder)
        self.abroadCommentComposeVC = AbroadCommentComposeViewController(formCells: [NLFNucleusComposeCommentFormCell(reuseIdentifier: "abroad.cell.textfield", placeHolderText: "Comment on this post", buttonText:"Comment", height: 50)])
        super.init(coder: aDecoder)
        self.composeBottomBorderView.backgroundColor = kCommentComposerBorderColor
        self.composeTopBorderView.backgroundColor = kCommentComposerBorderColor
    }

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
    }

    override func viewDidLayoutSubviews() {
        var height = self.abroadStatusDetailsVC.contentHeight()

        var offsetY = self.view.frame.origin.y + self.navigationController!.navigationBar.frame.height
        self.detailsSubview.frame = CGRectMake(self.view.frame.origin.x, offsetY, self.view.frame.width, height)
        offsetY += height + kStatusDetailsVerticalSpacing

        height = kCommentComposerBorderWidth
        self.composeTopBorderView.frame = CGRectMake(self.view.frame.origin.x, offsetY, self.view.frame.width, height)
        offsetY += height

        height = self.abroadCommentComposeVC.contentHeight()
        self.commentComposerSubiew.frame = CGRectMake(self.view.frame.origin.x, offsetY, self.view.frame.width, height)
        offsetY += height

        height = kCommentComposerBorderWidth
        self.composeBottomBorderView.frame = CGRectMake(self.view.frame.origin.x, offsetY, self.view.frame.width, height)
        offsetY += height

        self.commentsSubview.frame = CGRectMake(self.view.frame.origin.x, offsetY, self.view.frame.width, self.view.frame.height - offsetY)
    }

    override func viewDidAppear(animated: Bool) {

        self.view.addSubview(detailsSubview)
        self.detailsSubview.addSubview(self.abroadStatusDetailsVC.view)
        self.abroadStatusDetailsVC.didMoveToParentViewController(self)

        self.view.addSubview(commentComposerSubiew)
        self.commentComposerSubiew.addSubview(self.abroadCommentComposeVC.view)
        self.abroadCommentComposeVC.didMoveToParentViewController(self)

        self.view.addSubview(commentsSubview)
        self.commentsSubview.addSubview(self.abroadCommentTableVC.view)
        self.abroadCommentTableVC.didMoveToParentViewController(self)

        self.view.addSubview(composeTopBorderView)
        self.view.addSubview(composeBottomBorderView)
    }

    func setup() {
        self.abroadStatusDetailsVC.abroadDetailedStatus = self.abroadDetailedStatus
        self.abroadCommentTableVC.abroadStatus = self.abroadDetailedStatus?.abroadStatus
        self.abroadCommentComposeVC.abroadDetailedStatus = self.abroadDetailedStatus
        self.addChildViewController(self.abroadStatusDetailsVC)
        self.addChildViewController(self.abroadCommentComposeVC)
        self.addChildViewController(self.abroadCommentTableVC)
    }
}
