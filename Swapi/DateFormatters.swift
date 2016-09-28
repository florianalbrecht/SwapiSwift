//
//  DateFormatters.swift
//  Swapi
//
//  Created by Florian Albrecht on 28.09.16.
//  Copyright © 2016 Florian Albrecht. All rights reserved.
//

import Foundation

struct DateFormatters {
    static let defaultFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.timeZone = TimeZone(abbreviation: "UTC");
        return formatter
    }()

    static let releaseDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "UTC");
        return formatter
    }()
}
