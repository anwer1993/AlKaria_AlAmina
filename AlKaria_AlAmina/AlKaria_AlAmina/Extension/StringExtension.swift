//
//  StringExtension.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 24/11/2022.
//

import Foundation


extension String {
    
    var dateFromString: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self)
    }
    
}
