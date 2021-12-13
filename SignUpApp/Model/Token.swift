//
//  Token.swift
//  SignUpApp
//
//  Created by Alex Mochalov on 13/12/2021.
//

import Foundation


struct Token: Decodable {
    let token: String
}


extension Token {
    static let mockDataSuccess = """
{"token": "Bearer asd123q.asdasd13.asdasd123"}
"""
}
