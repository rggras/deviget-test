//
//  Date+extensions.swift
//  DevigetTest
//
//  Created by Rodrigo Gras on 26/11/2019.
//  Copyright © 2019 Rodrigo Gras. All rights reserved.
//

import Foundation

extension Date {

    func timeAgo() -> String {

        if let interval = Calendar.current.dateComponents([.year], from: self, to: Date()).year, interval > 0  {
            return interval == 1 ? "\(interval)" + " " + "year ago" : "\(interval)" + " " + "years ago"
        }

        if let interval = Calendar.current.dateComponents([.month], from: self, to: Date()).month, interval > 0  {
            return interval == 1 ? "\(interval)" + " " + "month ago" : "\(interval)" + " " + "months ago"
        }

        if let interval = Calendar.current.dateComponents([.day], from: self, to: Date()).day, interval > 0  {
            return interval == 1 ? "\(interval)" + " " + "day ago" : "\(interval)" + " " + "days ago"
        }

        if let interval = Calendar.current.dateComponents([.hour], from: self, to: Date()).hour, interval > 0 {
            return interval == 1 ? "\(interval)" + " " + "hour ago" : "\(interval)" + " " + "hours ago"
        }

        if let interval = Calendar.current.dateComponents([.minute], from: self, to: Date()).minute, interval > 0 {
            return interval == 1 ? "\(interval)" + " " + "minute ago" : "\(interval)" + " " + "minutes ago"
        }

        return "a moment ago"
    }
}
