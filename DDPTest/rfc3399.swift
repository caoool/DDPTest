//
//  rfc3399.swift
//  DDPTest
//
//  Created by Lu Cao on 7/12/16.
//  Copyright © 2016 Lu Cao. All rights reserved.
//

import Foundation

private var rfc3339formatter:NSDateFormatter = {
    let formatter = NSDateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z"
    formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
    formatter.calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierISO8601)!
    formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    return formatter
}()


extension NSDate {
    var stringFormattedAsRFC3339: String {
        return rfc3339formatter.stringFromDate(self)
    }
    
    convenience init?(RFC3339FormattedString:String) {
        if let d = rfc3339formatter.dateFromString(RFC3339FormattedString) {
            self.init(timeInterval:0,sinceDate:d)
        }
        else { return nil }
    }
}