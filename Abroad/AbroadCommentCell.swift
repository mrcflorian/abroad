//
//  AbroadCommentCell.swift
//  Abroad
//
//  Created by Florian Marcu on 5/23/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

let kCommentImageCornerRadius: CGFloat = 4.0
let kCommentImageSize: CGSize = CGSize(width: 50, height: 50)
let kCommentVerticalPadding: CGFloat = 5
let kCommentHorizontalPadding: CGFloat = 10

class AbroadCommentCell: UITableViewCell
{
    var commentImageView = NLFDownloadableImageView()
    var commentTextView = UITextView()

    init(reuseIdentifier: String)
    {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        self.commentTextView.userInteractionEnabled = false
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
        self.separatorInset = UIEdgeInsetsMake(0, self.bounds.size.width, 0, 0)

        self.commentImageView.clipsToBounds = true
        self.commentImageView.layer.cornerRadius = kPostImageCornerRadius
        self.commentTextView.editable = false
        self.commentTextView.selectable = false

        self.addSubview(self.commentImageView)
        self.addSubview(self.commentTextView)
        self.setNeedsLayout()
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        let frame = self.bounds
        self.commentImageView.frame = CGRectMake(frame.origin.x + kCommentHorizontalPadding, frame.origin.y + kCommentVerticalPadding, kCommentImageSize.width, kCommentImageSize.height)

        let width: CGFloat = frame.width - 3 * kCommentHorizontalPadding - kCommentImageSize.width
        self.commentTextView.frame = CGRectMake(frame.origin.x + kCommentImageSize.width + 2 * kCommentHorizontalPadding, frame.origin.y + kCommentVerticalPadding, width, kCommentImageSize.height)
    }

    class func height() -> CGFloat {
        return 2 * kCommentVerticalPadding + kCommentImageSize.height
    }
}
