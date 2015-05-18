//
//  AbroadSongCell.swift
//  Abroad
//
//  Created by Florian Marcu on 4/12/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//
import NucleusFramework

let kSongImageCornerRadius: CGFloat = 4.0

class AbroadSongCell: UITableViewCell
{
    var songImageView = NLFDownloadableImageView()
    var songTextView = UITextView()

    init(reuseIdentifier: String)
    {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        self.songImageView.clipsToBounds = true
        self.songImageView.layer.cornerRadius = kSongImageCornerRadius
        
        self.addSubview(self.songImageView)
        self.addSubview(self.songTextView)
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        let frame = self.bounds
        self.songImageView.frame = CGRectMake(frame.origin.x, frame.origin.y, 30, 30)
        self.songTextView.frame = CGRectMake(frame.origin.x + 35, frame.origin.y, 150, 30)
    }
}
