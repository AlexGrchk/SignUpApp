//
//  ValidationPublishers.swift
//  NettellerComponents
//
//  Created by Alexander on 08/10/2021.
//  Copyright © 2021 NetInfo plc. All rights reserved.
//

import Foundation
import Combine


open class ValidationPublishers {
    
    static func nonEmptySubmitValidation(with isValidating: Published<Bool>.Publisher, for valuePublisher: Published<String>.Publisher, errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher {
        Publishers.CombineLatest(isValidating, valuePublisher)
            .map { status, value in
                if status {
                    return value.count > 0 ? .success : .failure(message: errorMessage())
                } else {
                    return .failure(message: "")
                }
            }
            .eraseToAnyPublisher()
    }
    
    static func nonEmptyValidation(for publisher: Published<String>.Publisher,
                                       errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher {
        return publisher.map { value in
            guard value.count > 0 else {
                return .failure(message: errorMessage())
            }
            return .success
        }
        .eraseToAnyPublisher()
    }
    
    static func matcherValidation(for publisher: Published<String>.Publisher,
                                      withPattern pattern: String,
                                      errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher {
        return publisher.map { value in
            guard value.validates(regex: pattern) else {
                return .failure(message: errorMessage())
            }
            return .success
        }
        .eraseToAnyPublisher()
    }
    
    public static func notNilValidation<T>(for publisher: Published<T?>.Publisher,
                                    errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher {
        return publisher.map { value in
            if value == nil {
                return .failure(message: errorMessage())
            } else {
                return .success
            }
        }
        .eraseToAnyPublisher()
    }
}
