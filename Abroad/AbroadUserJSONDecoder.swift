//
//  AbroadUserJSONDecoder.swift
//  Abroad
//
//  Created by Florian Marcu on 6/4/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadUserJSONDecoder: NLFNucleusJSONDecoder {
    func decodeFromJSONDictionary(jsonDictionary: NSDictionary) -> NLFNucleusStreamableOject
    {
        return AbroadUser(jsonDictionary: jsonDictionary)
    }
}
