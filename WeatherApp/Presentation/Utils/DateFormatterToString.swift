//
//  FormatDateFromModel.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 5/8/23.
//

import Foundation

//A function that changes the given data to a String in the format EEEE, MMM d (week day, month day)
struct DateFormatterToString {
    static func formatDateAndCastToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        
        let dateString = formatter.string(from: date)
        
        guard let finalDate = formatter.date(from: dateString) else {return K.Literals.noDate}
        
        return formatter.string(from : finalDate)
    }
}
