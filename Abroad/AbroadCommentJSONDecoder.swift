//
//  AbroadCommentJSONDecoder.swift
//  Abroad
//
//  Created by Florian Marcu on 5/23/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadCommentJSONDecoder: NLFNucleusJSONDecoder
{
    func decodeFromJSONDictionary(jsonDictionary: NSDictionary) -> NLFNucleusStreamableOject
    {
        return AbroadComment(jsonDictionary: jsonDictionary)
    }
}
