//
//  AbroadUserCell.swift
//  Abroad
//
//  Created by Florian Marcu on 5/19/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadUserCell: UITableViewCell {
    var userImageView = NLFDownloadableImageView()
    var userTextView = UITextView()

    init(reuseIdentifier: String)
    {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        self.userTextView.userInteractionEnabled = false
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
        self.separatorInset = UIEdgeInsetsMake(0, self.bounds.size.width, 0, 0)

        self.userImageView.clipsToBounds = true
        self.userImageView.layer.cornerRadius = kPostImageCornerRadius
        self.userTextView.editable = false
        self.userTextView.selectable = false

        self.addSubview(self.userImageView)
        self.addSubview(self.userTextView)
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        let frame = self.bounds
        self.userImageView.frame = CGRectMake(frame.origin.x + kPostHorizontalPadding, frame.origin.y + kPostVerticalPadding, kPostImageSize.width, kPostImageSize.height)

        let width: CGFloat = frame.width - 3 * kPostHorizontalPadding - kPostImageSize.width
        self.userTextView.frame = CGRectMake(frame.origin.x + kPostImageSize.width + 2 * kPostHorizontalPadding, frame.origin.y + kPostVerticalPadding, width, kPostImageSize.height)
    }

    class func height() -> CGFloat {
        return 2 * kPostVerticalPadding + kPostImageSize.height
    }
}
