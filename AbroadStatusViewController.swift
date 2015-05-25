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

let kCommentComposerBorderWidth: CGFloat = 1.0
let kCommentComposerBorderColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)

class AbroadStatusViewController: NLFNucleusViewController {

    var abroadStatusDetailsVC: AbroadStatusDetailsViewController
    var abroadCommentTableVC: AbroadCommentTableViewController
    var abroadCommentComposeVC: AbroadCommentComposeViewController

    var detailsSubview = UIView()
    var commentsSubview = UIView()
    var commentComposerSubiew = UIView()

    var abroadDetailedStatus: AbroadDetailedStatus? {
        didSet {
            self.setup()
        }
    }

    required init(coder aDecoder: NSCoder) {
        self.abroadStatusDetailsVC = AbroadStatusDetailsViewController(coder: aDecoder)
        self.abroadCommentTableVC = AbroadCommentTableViewController(coder: aDecoder)
        self.abroadCommentComposeVC = AbroadCommentComposeViewController(formCells: [NLFNucleusTextFieldFormCell(reuseIdentifier: "abroad.cell.textfield", placeHolderText: "Comment on this post", height: 50)])
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
    }

    override func viewDidLayoutSubviews() {
        var height = self.abroadStatusDetailsVC.contentHeight()
        var offsetY = self.view.frame.origin.y + self.navigationController!.navigationBar.frame.height

        self.detailsSubview.frame = CGRectMake(self.view.frame.origin.x, offsetY, self.view.frame.width, height)

        offsetY += height + 34
        height = self.abroadCommentComposeVC.contentHeight() + 34

        self.commentComposerSubiew.frame = CGRectMake(self.view.frame.origin.x, offsetY, self.view.frame.width, height)

        offsetY += height + 2 * kCommentComposerBorderWidth

        self.commentsSubview.frame = CGRectMake(self.view.frame.origin.x, offsetY, self.view.frame.width, self.view.frame.height - self.abroadStatusDetailsVC.contentHeight() - self.abroadCommentComposeVC.contentHeight())
    }

    override func viewDidAppear(animated: Bool) {

        self.view.addSubview(detailsSubview)
        self.detailsSubview.addSubview(self.abroadStatusDetailsVC.view)
        self.abroadStatusDetailsVC.didMoveToParentViewController(self)

        let topBorder = CALayer()
        topBorder.backgroundColor = kCommentComposerBorderColor.CGColor
        topBorder.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, kCommentComposerBorderWidth)
        self.commentComposerSubiew.layer.addSublayer(topBorder)

        self.view.addSubview(commentComposerSubiew)
        self.commentComposerSubiew.addSubview(self.abroadCommentComposeVC.view)
        self.abroadCommentComposeVC.didMoveToParentViewController(self)

        let bottomBorder = CALayer()
        bottomBorder.backgroundColor = kCommentComposerBorderColor.CGColor
        bottomBorder.frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, kCommentComposerBorderWidth)
        self.commentsSubview.layer.addSublayer(bottomBorder)

        self.view.addSubview(commentsSubview)
        self.commentsSubview.addSubview(self.abroadCommentTableVC.view)
        self.abroadCommentTableVC.didMoveToParentViewController(self)
    }

    func setup() {
        self.abroadStatusDetailsVC.abroadDetailedStatus = self.abroadDetailedStatus
        self.abroadCommentTableVC.abroadStatus = self.abroadDetailedStatus?.abroadStatus
        self.addChildViewController(self.abroadStatusDetailsVC)
        self.addChildViewController(self.abroadCommentComposeVC)
        self.addChildViewController(self.abroadCommentTableVC)
    }

}
