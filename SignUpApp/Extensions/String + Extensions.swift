//
//  String + Extensions.swift
//  SignUpApp
//
//  Created by Alex Mochalov on 13/12/2021.
//

import Foundation

extension String {
    
    
    func validates(regex:String,caseSensitive:Bool = true) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let nsString = self as NSString
            let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
            return !results.map { nsString.substring(with: $0.range)}.isEmpty
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return false
        }
    }
}
