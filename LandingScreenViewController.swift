//
//  LandingScreenViewController.swift
//  Abroad
//
//  Created by Florian Marcu on 4/11/15.
//  Copyright (c) 2015 Florian Marcu. All rights reserved.
//

import NucleusFramework

class LandingScreenViewController: NLFNucleusViewController
{
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet var facebookLoginButton: UIButton!

    private let locationManager = NLFNucleusLocationManager(distanceFilter: 1000)
    private var initialViewController: UIViewController?
    private var currentUser: AbroadUser?

    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: kFacebookManagerDidFetchUserNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: kNLFNucleusLocationManagerDidUpdateLocation, object: nil)
    }

    @IBAction func didTapLoginButton(sender: UIButton) {
        FBSDKLoginManager().logInWithReadPermissions(kFacebookManagerPermissions, handler: handleFacebookLoginResponse)
        facebookLoginButton.hidden = true
        activityIndicatorView.hidden = false
    }

    func handleFacebookLoginResponse(result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        if error != nil {
            self.handleFacebookLoginError(error)
        } else if (result.isCancelled) {
            self.handleFacebookLoginCancellation(result)
        } else {
            self.handleFacebookLoginSuccess(result);
        }
    }
    
    func handleFacebookLoginError(error: NSError!)
    {
        self.prepareForRetry()
    }

    func handleFacebookLoginCancellation(result: FBSDKLoginManagerLoginResult!)
    {
        self.prepareForRetry()
    }

    func handleFacebookLoginSuccess(result: FBSDKLoginManagerLoginResult!)
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didFetchFacebookUser:", name: kFacebookManagerDidFetchUserNotification, object: nil)
        FacebookAPIManager.fetchDataForCurrentUser()
    }

    func goToHomeScreen()
    {
        let storyboard = UIStoryboard(name:"AbroadMain", bundle:nil)
        initialViewController = storyboard.instantiateInitialViewController() as? UIViewController
        self.presentViewController(initialViewController!, animated:true, completion:nil)
    }

    func didFetchFacebookUser(notification: NSNotification)
    {
        self.goToHomeScreen()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didUpdateUserLocation:", name: kNLFNucleusLocationManagerDidUpdateLocation, object: nil)

        AbroadAPI.requestUser(notification.object as! String, completionHandler: { (user) -> Void in
            let tabBarController = self.initialViewController!.childViewControllers.first as! AbroadTabBarController
            let homeViewController = tabBarController.childViewControllers.first as! HomeScreenViewController
            self.currentUser = user
            homeViewController.user = user
            self.locationManager.startUpdatingLocation()
        })
    }

    func didUpdateUserLocation(notification: NSNotification)
    {
        if (notification.userInfo != nil) {
            let userInfo = notification.userInfo as! Dictionary<String, String>
            // TODO: Send the coordinates to the server
            self.currentUser?.longitude = userInfo["longitude"]
            self.currentUser?.latitude = userInfo["latitude"]
            NSNotificationCenter.defaultCenter().removeObserver(self, name: kNLFNucleusLocationManagerDidUpdateLocation, object: nil)
        }
    }

    func prepareForRetry()
    {
        facebookLoginButton.hidden = false
        activityIndicatorView.hidden = true
    }
}
