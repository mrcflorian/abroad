//
//  AbroadSongCell.swift
//  Abroad
//
//  Created by Florian Marcu on 4/12/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//
import NucleusFramework

let kPostImageCornerRadius: CGFloat = 4.0
let kPostImageSize: CGSize = CGSize(width: 50, height: 50)
let kPostVerticalPadding: CGFloat = 15
let kPostHorizontalPadding: CGFloat = 10

class AbroadPostCell: UITableViewCell
{
    var postImageView = NLFDownloadableImageView()
    var postTextView = UITextView()

    init(reuseIdentifier: String)
    {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        self.postTextView.userInteractionEnabled = false
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
        self.separatorInset = UIEdgeInsetsMake(0, self.bounds.size.width, 0, 0)

        self.postImageView.clipsToBounds = true
        self.postImageView.layer.cornerRadius = kPostImageCornerRadius
        self.postTextView.editable = false
        self.postTextView.selectable = false
        self.postTextView.clipsToBounds = true
        self.postTextView.font = UIFont.systemFontOfSize(16, weight: 0.05)
        self.postTextView.contentInset = UIEdgeInsetsMake(-10,0,0,0)

        self.addSubview(self.postImageView)
        self.addSubview(self.postTextView)
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        let frame = self.bounds
        self.postImageView.frame = CGRectMake(frame.origin.x + kPostHorizontalPadding, frame.origin.y + kPostVerticalPadding, kPostImageSize.width, kPostImageSize.height)
        
        let width: CGFloat = frame.width - 3 * kPostHorizontalPadding - kPostImageSize.width
        self.postTextView.frame = CGRectMake(frame.origin.x + kPostImageSize.width + 2 * kPostHorizontalPadding, frame.origin.y + kPostVerticalPadding, width, self.postTextView.sizeThatFits(self.bounds.size).height)
    }
    
    class func height() -> CGFloat {
        return 2 * kPostVerticalPadding + kPostImageSize.height + kPostHorizontalPadding
    }
}
