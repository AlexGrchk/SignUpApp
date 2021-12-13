//
//  SignUpViewModel.swift
//  SignUpApp
//
//  Created by Alex Mochalov on 14/12/2021.
//

import Foundation
import Combine

class SignUpViewModel: RequestViewModel {
    @Published var email: String = ""
    @Published var password: String = ""

    @Published var errorMessage: String?
    
    var successfulSignupSubject = PassthroughSubject<Void, Never>()
    
    // Should inject repository
    private var signUpRepository: SignUpRepository = SignUpRepositoryImpl()
    
    lazy var emailValidator: ValidationPublisher = {
        self.$email.nonEmptyValidator("")
    }()
    
    lazy var passwordValidator: ValidationPublisher = {
        self.$password.nonEmptyValidator("")
    }()
    
    lazy var emailRegexValidator: ValidationPublisher = {
        self.$email.matcherValidation(RegularExpressions.validEmail, "")
    }()
    
    lazy var passwordRegexValidator: ValidationPublisher = {
        self.$password.matcherValidation(RegularExpressions.validPassword, "")
    }()
    
    lazy var formValidator: ValidationPublisher = {
        Publishers.CombineLatest4(self.emailValidator, self.passwordValidator, self.emailRegexValidator, self.passwordRegexValidator)
            .map { v1, v2, v3, v4 in
                return [v1,v2,v3,v4].allSatisfy({ $0.isSuccess }) ? Validation.success : Validation.failure(message: "")
            }
            .eraseToAnyPublisher()
    }()
    
    func submit() {
        self.isLoadingData = true
        self.signUpRepository.signup(email: self.email, password: self.password) { response in
            self.isLoadingData = false
            switch response {
            case .success(_):
                self.successfulSignupSubject.send()
            case .error(let error):
                self.errorMessage = error
            }
        }
    }
    
}
