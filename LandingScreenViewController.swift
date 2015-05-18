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
        self.goToHomeScreen();
    }
    
    func goToHomeScreen()
    {
        let storyboard = UIStoryboard(name:"AbroadMain", bundle:nil)
        let viewController = storyboard.instantiateInitialViewController() as! UIViewController
        self.presentViewController(viewController, animated:true, completion:nil)
    }
    
    func prepareForRetry()
    {
        facebookLoginButton.hidden = false
        activityIndicatorView.hidden = true
    }
}
