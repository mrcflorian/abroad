//
//  AbroadPostJSONDecoder.swift
//  Abroad
//
//  Created by Florian Marcu on 5/21/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadPostJSONDecoder: NLFNucleusJSONDecoder
{
    func decodeFromJSONDictionary(jsonDictionary: NSDictionary) -> AnyObject
    {
        return AbroadPost(jsonDictionary: jsonDictionary)
    }
}
