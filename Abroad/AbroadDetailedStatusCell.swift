//
//  AbroadDetailedStatusCell.swift
//  Abroad
//
//  Created by Florian Marcu on 5/23/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

let kDetailedStatusImageCornerRadius: CGFloat = 4.0
let kDetailedStatusImageSize: CGSize = CGSize(width: 70, height: 70)

let kDetailedStatusVerticalPadding: CGFloat = 5.0
let kDetailedStatusHorizontalPadding: CGFloat = 10.0
//let kLikeButtonHeight: CGFloat = 40.0
let kActionsContainerBackgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)

class AbroadDetailedStatusCell: UITableViewCell
{
    var statusDetailsContainer = UIView()
    //var activitySummaryContainer = UIView()
    //var actionsContainer = UIView()

    var authorImageView = NLFDownloadableImageView()
    var statusTextView = UITextView()

    //var likersButton = UIButton()

    //var likeButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton

    init(reuseIdentifier: String) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        self.preservesSuperviewLayoutMargins = false
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.layoutMargins = UIEdgeInsetsZero
        self.separatorInset = UIEdgeInsetsMake(0, self.bounds.size.width, 0, 0)

        self.authorImageView.clipsToBounds = true
        self.authorImageView.layer.cornerRadius = kPostImageCornerRadius

        self.statusTextView.userInteractionEnabled = false
        self.statusTextView.editable = false
        self.statusTextView.selectable = false
        self.statusTextView.font = UIFont.systemFontOfSize(16)

        self.addSubview(statusDetailsContainer)
        //self.addSubview(activitySummaryContainer)
        //self.addSubview(actionsContainer)

        self.statusDetailsContainer.addSubview(self.authorImageView)
        self.statusDetailsContainer.addSubview(self.statusTextView)


        //self.activitySummaryContainer.addSubview(self.likersButton)

        //self.likeButton.setTitle("Like", forState: .Normal)

        //self.actionsContainer.backgroundColor = kActionsContainerBackgroundColor

        //self.actionsContainer.addSubview(self.likeButton)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        let frame = self.bounds
        var offsetY = self.bounds.origin.y

        self.statusDetailsContainer.frame = CGRectMake(frame.origin.x, offsetY, frame.width, kDetailedStatusImageSize.height + 2 * kDetailedStatusVerticalPadding)

        self.authorImageView.frame = CGRectMake(frame.origin.x + kDetailedStatusHorizontalPadding, frame.origin.y + kDetailedStatusVerticalPadding, kDetailedStatusImageSize.width, kDetailedStatusImageSize.height)

        let width: CGFloat = frame.width - 3 * kDetailedStatusHorizontalPadding - kDetailedStatusImageSize.width
        self.statusTextView.frame = CGRectMake(frame.origin.x + kDetailedStatusImageSize.width + 2 * kDetailedStatusHorizontalPadding, frame.origin.y + kDetailedStatusVerticalPadding, width, kDetailedStatusImageSize.height)

        //offsetY += kDetailedStatusImageSize.height + 2 * kDetailedStatusVerticalPadding

        //self.actionsContainer.frame = CGRectMake(frame.origin.x, offsetY, frame.width, 2 * kDetailedStatusVerticalPadding + kLikeButtonHeight)
        //self.likeButton.frame = CGRectMake(self.actionsContainer.frame.width - self.likeButton.sizeThatFits(self.actionsContainer.frame.size).width - kDetailedStatusHorizontalPadding, kDetailedStatusVerticalPadding, self.likeButton.sizeThatFits(self.actionsContainer.frame.size).width, kLikeButtonHeight)

        //offsetY += kLikeButtonHeight + 2 * kDetailedStatusVerticalPadding
    }

    class func height() -> CGFloat {
        return 2 * kDetailedStatusVerticalPadding + kDetailedStatusImageSize.height + 4 * kDetailedStatusVerticalPadding
    }

}
