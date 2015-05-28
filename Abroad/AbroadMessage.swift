//
//  NLFNucleusMessage.swift
//  NucleusFramework
//
//  Created by Florian Marcu on 5/26/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import Foundation

class AbroadMessage : NSObject, JSQMessageData {
    var text_: String
    var sender_: AbroadUser
    var recipient_: AbroadUser
    var date_: NSDate
    var imageUrl_: String?

    convenience init(text: String?, sender: AbroadUser?, recipient: AbroadUser?) {
        self.init(text: text, sender: sender, recipient: recipient, imageUrl: nil)
    }

    init(text: String?, sender: AbroadUser?, recipient: AbroadUser?, imageUrl: String?) {
        self.text_ = text!
        self.sender_ = sender!
        self.recipient_ = recipient!
        self.date_ = NSDate()
        self.imageUrl_ = imageUrl
    }

    func text() -> String! {
        return text_;
    }

    func sender() -> String! {
        return sender_.firstName;
    }

    func date() -> NSDate! {
        return date_;
    }

    func imageUrl() -> String? {
        return imageUrl_;
    }
}
