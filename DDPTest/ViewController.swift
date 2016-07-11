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

//    let collection:MeteorCollection<Temp> = (UIApplication.sharedApplication().delegate as! AppDelegate).temps
    let collection:MeteorCollection<Event> = (UIApplication.sharedApplication().delegate as! AppDelegate).events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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

    @IBAction func loginWithToken(sender: UIButton) {
//        print(NSUserDefaults.standardUserDefaults().stringForKey("DDP_TOKEN"))
        Meteor.call("users.loginWithToken", params: [NSUserDefaults.standardUserDefaults().stringForKey("DDP_TOKEN")!]) { result, error in
            print(result)
        }
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
    
    @IBAction func subscribe(sender: UIButton) {
        
        Meteor.subscribe("events.feeds") {
            print(self.collection.sorted)
        }
        
    }
    
    @IBAction func setUserTags(sender: AnyObject) {
        Meteor.call("users.setTags", params: [["a","b","c"]]) { result, error in
            if ((error) != nil) {
                print(error)
            } else {
                print(result)
            }
        }
    }
    
    @IBAction func insertEvent(sender: AnyObject) {
        let jsonObject: [String: AnyObject] = [
            "summary": "Some thing you might want",
            "description": "I am optional",
            "start": [
                "dateTime": NSDate().stringFormattedAsRFC3339
            ],
            "end": [
                "dateTime": NSDate().stringFormattedAsRFC3339
            ]
        ]
        let calendarId = "caooolu@gmail.com"
        Meteor.call("events.insert", params: [calendarId, jsonObject]) { result, error in
            if ((error) != nil) {
                print(error)
            } else {
                print(result)
            }
        }
    }
    
    @IBAction func syncCalendar(sender: AnyObject) {
        Meteor.call("calendars.sync", params: ["caooolu@gmail.com", "MdrGxH8SFRcZREcB4"]) { result, error in
            if ((error) != nil) {
                print(error)
            } else {
                print(result)
            }
        }
    }
}

