//
//  AbroadTabBarController.swift
//  Abroad
//
//  Created by Florian Marcu on 5/19/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework
import UIKit

class AbroadTabBarController: UITabBarController {

    @IBOutlet var addPostButton: UIBarButtonItem!
    var user: AbroadUser?
    var addStatusNavigationController: NLFNucleusNavigationController?
    lazy var addStatusCellsArray = [NLFNucleusTextFieldFormCell(reuseIdentifier: "abroad.cell.textfield", placeHolderText: "What's on your mind")]

    @IBAction func addPostButtonDidTap(sender: UIBarButtonItem) {
        self.presentAddPostViewController()
    }

    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        self.navigationItem.title = item.title!
    }

    func presentAddPostViewController() {
        let addStatusVC = NLFNucleusFormTableViewController(formCells: self.addStatusCellsArray)
        addStatusNavigationController = NLFNucleusNavigationController(rootViewController:addStatusVC)

        addStatusVC.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: UIBarButtonItemStyle.Plain, target: self, action: "didTapPostButton:")
        addStatusVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: addStatusNavigationController, action: "didTapCancelButton:")
        addStatusVC.navigationItem.title = "Update Status"

        self.navigationController?.presentViewController(self.addStatusNavigationController!, animated: true, completion: {
            self.addStatusCellsArray.first?.becomeFirstResponder()
        })
    }

    func didTapPostButton(sender: AnyObject) {
        let statusText = self.addStatusCellsArray.first?.textValue()

        if (statusText != nil && count(statusText!) > 0 && self.user != nil) {
            AbroadAPI.addStatus(self.user!.userID, textValue: statusText!, completionHandler: nil)
        }
        self.addStatusNavigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
