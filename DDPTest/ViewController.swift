//
//  ViewController.swift
//  DDPTest
//
//  Created by Lu Cao on 6/5/16.
//  Copyright © 2016 Lu Cao. All rights reserved.
//

import UIKit
import SwiftDDP

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Meteor.client.allowSelfSignedSSL = true
        Meteor.client.logLevel = .Info
        
        Meteor.connect("wss://www.loopcowstudio.com/websocket") {
            // do something after the client connects
            print("Connected")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func testConnection(sender: UIButton) {
        Meteor.call("conn.test" ,params: nil) { result, error in
            print(result)
        }
    }

    @IBAction func loginWithGoogle(sender: UIButton) {
        Meteor.loginWithGoogle("22026107675-jfeoijhr5qlpvds0v0dtlvpsv8njsioq.apps.googleusercontent.com", viewController: self)
    }

    @IBAction func logout(sender: UIButton) {
        Meteor.logout()
    }
    
    @IBAction func checkUserLogin(sender: UIButton) {
        Meteor.call("users.currentUser", params: nil) { result, error in
            print(result)
        }
    }
    
    @IBAction func listCalendars(sender: UIButton) {
        Meteor.call("calendars.list", params: nil) { result, error in
            if ((error) != nil) {
                print(error)
            } else {
                print(result)
            }
        }
    }
}

