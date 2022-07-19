//
//  Extensions.swift
//  Spender
//
//  Created by Tenzin wangyal on 7/15/22.
//

import Foundation
import SwiftUI

extension Color{
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

//MARK :- Parse Date
    //Since DateFormatter is expensive, it is good pratice to wrap it in
    //in lazy method, which only gets intialized once
extension DateFormatter{
    static let dateUSA: DateFormatter = {
        print("Intializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM,dd,yy"
        return formatter
    }()
}

extension String{
    func dateParsed() -> Date{
        //MARK :- since this might fail, guard let it and return Date()
        guard let parsedDate = DateFormatter.dateUSA.date(from: self) else{return Date()}
        return parsedDate
    }
}

extension Date : Strideable{
    func formatted() -> String{ //override date format
        return self.formatted(.dateTime.year().month().day())
    }
}

extension Double {
    func roundedTo2Digits() -> Double{
        return (self * 100).rounded() / 100
    }
}
