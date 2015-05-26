//
//  NLFNucleusMessage.swift
//  NucleusFramework
//
//  Created by Florian Marcu on 5/26/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import Foundation

public class NLFNucleusMessage : NSObject, JSQMessageData {
    var text_: String
    var sender_: String
    var date_: NSDate
    var imageUrl_: String?

    public convenience init(text: String?, sender: String?) {
        self.init(text: text, sender: sender, imageUrl: nil)
    }

    public init(text: String?, sender: String?, imageUrl: String?) {
        self.text_ = text!
        self.sender_ = sender!
        self.date_ = NSDate()
        self.imageUrl_ = imageUrl
    }

    public func text() -> String! {
        return text_;
    }

    public func sender() -> String! {
        return sender_;
    }

    public func date() -> NSDate! {
        return date_;
    }

    public func imageUrl() -> String? {
        return imageUrl_;
    }
}
