//
//  ValidationViewModel.swift
//  NettellerComponents
//
//  Created by Alexander on 11/10/2021.
//  Copyright © 2021 NetInfo plc. All rights reserved.
//

import Combine

open class RequestViewModel: ObservableObject {
    
    @Published public var isLoadingData: Bool = false

    
    public var subscriptions: Set<AnyCancellable> = .init()
    
    deinit {
        self.subscriptions.forEach {
            $0.cancel()
        }
    }
    public init() {
        
    }
}


open class ValidationViewModel: RequestViewModel {
    @Published public var showErrors: Bool = false
    @Published private var formValidation: Validation?
    
    
    lazy var formValidator: ValidationPublisher = {
        self.createFormValidator()
    }()
    
    open func createFormValidator() -> ValidationPublisher {
        return Just(.failure(message: ""))
            .eraseToAnyPublisher()
    }
    
    public override init() {
        super.init()
        self.formValidator.sink { validation in
            switch validation {
            case .success:
                self.formValidation = validation
            case .failure(message: _):
                self.formValidation = nil
            }
        }.store(in: &subscriptions)
    }
    
    open func didSubmit() {
        if self.formValidation?.isSuccess ?? false {
            self.onSuccessValidation()
        } else {
            self.showErrors = true
        }
    }
    
    open func onSuccessValidation() {
        print("validation success")
    }
}
