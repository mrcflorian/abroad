//
//  AbroadTabBarController.swift
//  Abroad
//
//  Created by Florian Marcu on 5/19/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class AbroadTabBarController: UITabBarController {
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        self.navigationItem.title = item.title!
    }
}
