//
//  Validation.swift
//  NettellerComponents
//
//  Created by Alexander on 08/10/2021.
//  Copyright © 2021 NetInfo plc. All rights reserved.
//

import Foundation


public enum Validation {
    case success
    case failure(message: String)
    public var isSuccess: Bool {
        if case .success = self {
            return true
        }
        return false
    }
}
