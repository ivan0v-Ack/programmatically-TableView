//
//  Date-Extention.swift
//  TableViewChat
//
//  Created by Ivan Ivanov on 3/4/21.
//

import UIKit

extension Date {
    
    static func dateFormatCustomString(customString: String) -> Date{
        let dateForrmater = DateFormatter()
        dateForrmater.dateFormat = "MM/dd/yyyy"
        return dateForrmater.date(from: customString) ?? Date()
    }
}
