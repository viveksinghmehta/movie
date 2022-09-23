//
//  Helper.swift
//  Movies
//
//  Created by Vivek Singh Mehta on 23/09/22.
//

import Foundation


class Helper {
    
    class func stringDateToString(date: String?) -> String {
        guard let value = date else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: value) else { return "" }
        return dateToString(date: date)
    }
    
    class func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: date)
    }
    
}
