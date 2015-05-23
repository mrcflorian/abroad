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
let kDetailedStatusVerticalPadding: CGFloat = 5
let kDetailedStatusHorizontalPadding: CGFloat = 10

class AbroadDetailedStatusCell: UITableViewCell
{
    var authorImageView = NLFDownloadableImageView()
    var statusTextView = UITextView()

    init(reuseIdentifier: String)
    {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        self.statusTextView.userInteractionEnabled = false
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
        self.separatorInset = UIEdgeInsetsMake(0, self.bounds.size.width, 0, 0)

        self.authorImageView.clipsToBounds = true
        self.authorImageView.layer.cornerRadius = kPostImageCornerRadius
        self.statusTextView.editable = false
        self.statusTextView.selectable = false

        self.addSubview(self.authorImageView)
        self.addSubview(self.statusTextView)
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        let frame = self.bounds
        self.authorImageView.frame = CGRectMake(frame.origin.x + kDetailedStatusHorizontalPadding, frame.origin.y + kDetailedStatusVerticalPadding, kDetailedStatusImageSize.width, kDetailedStatusImageSize.height)

        let width: CGFloat = frame.width - 3 * kDetailedStatusHorizontalPadding - kDetailedStatusImageSize.width
        self.statusTextView.frame = CGRectMake(frame.origin.x + kDetailedStatusImageSize.width + 2 * kDetailedStatusHorizontalPadding, frame.origin.y + kDetailedStatusVerticalPadding, width, kDetailedStatusImageSize.height)
    }

    class func height() -> CGFloat {
        return 2 * kDetailedStatusVerticalPadding + kDetailedStatusImageSize.height
    }

}
