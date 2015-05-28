//
//  AbroadDetailedStatus.swift
//  Abroad
//
//  Created by Florian Marcu on 5/23/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

class AbroadDetailedStatus: NSObject
{
    var abroadUser: AbroadUser
    var abroadStatus: AbroadPost

    init(abroadUser: AbroadUser, abroadStatus: AbroadPost) {
        self.abroadUser = abroadUser
        self.abroadStatus = abroadStatus
        super.init()
    }
}
