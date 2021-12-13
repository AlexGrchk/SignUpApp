//
//  Publisher + Extensions.swift
//  NettellerComponents
//
//  Created by Alexander on 08/10/2021.
//  Copyright © 2021 NetInfo plc. All rights reserved.
//

import Foundation
import Combine

public typealias ValidationErrorClosure = () -> String
public typealias ValidationPublisher = AnyPublisher<Validation, Never>


extension Published.Publisher where Value == Bool {
    
    func nonEmptySubmitValidator(valuePublisher: Published<String>.Publisher, errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher {
        return ValidationPublishers.nonEmptySubmitValidation(with: self, for: valuePublisher, errorMessage: errorMessage())
    }
    
}

public extension Published.Publisher where Value == String {
    
    func nonEmptyValidator(_ errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher {
        return ValidationPublishers.nonEmptyValidation(for: self, errorMessage: errorMessage())
    }


    func matcherValidation(_ pattern: String, _ errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher {
        return ValidationPublishers.matcherValidation(for: self, withPattern: pattern, errorMessage: errorMessage())
    }
    
}

public extension Published.Publisher {
    
    func notNilValidator<T>(_ errorMessage: @autoclosure @escaping ValidationErrorClosure) -> ValidationPublisher where T? == Value {
        return ValidationPublishers.notNilValidation(for: self, errorMessage: errorMessage())
    }
    
}
