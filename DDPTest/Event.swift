//
//  Event.swift
//  DDPTest
//
//  Created by Lu Cao on 6/30/16.
//  Copyright © 2016 Lu Cao. All rights reserved.
//

import Foundation
import SwiftDDP

class Event: MeteorDocument {
    
    var _id: String?
    var id: String?
    var etag: String?
    var description1: String?
    var summary:String?
    var start: AnyObject?
    var end: NSDate?
    var location: String?
    var visibility: String?
    var calendarId: String?
    var school: String?
    var club: String?
    var tags: [String]?
    var createdBy: String?
    var createdAt: NSDate?
    
    required init(id: String, fields: NSDictionary?) {
        super.init(id: id, fields: fields)
        
        self._id = id
    }
    
    override func update(fields: NSDictionary?, cleared: [String]?) {
        super.update(fields, cleared: cleared)
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        if (key == "id") {
            self.id = value as? String
        }
        
        if (key == "etag") {
            self.etag = value as? String
        }
        
        if (key == "description") {
            self.description1 = value as? String
        }
        
        if (key == "summary") {
            self.summary = value as? String
        }
        
        if (key == "start") {
            self.start = value as AnyObject?
        }
        
        if (key == "end") {
            self.end = value as? NSDate
        }
        
        if (key == "location") {
            self.location = value as? String
        }
        
        if (key == "visibility") {
            self.visibility = value as? String
        }
        
        if (key == "calendarId") {
            self.calendarId = value as? String
        }
        
        if (key == "school") {
            self.school = value as? String
        }
        
        if (key == "club") {
            self.club = value as? String
        }
        
        if (key == "tags") {
            self.tags = value as? [String]
        }
        
        if (key == "createdBy") {
            self.createdBy = value as? String
        }
        
        if (key == "createdAt") {
            self.createdAt = value as? NSDate
        }
    }
}