//
//  RegularExpressions.swift
//  SignUpApp
//
//  Created by Alex Mochalov on 13/12/2021.
//

import Foundation

struct RegularExpressions {
    static let validEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    static let validPassword = "^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$"
}
