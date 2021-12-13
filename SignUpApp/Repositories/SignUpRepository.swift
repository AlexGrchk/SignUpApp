//
//  SignUpRepository.swift
//  SignUpApp
//
//  Created by Alex Mochalov on 13/12/2021.
//

import Foundation

enum Response {
    case success(token: Token)
    case error(error: String)
}

protocol SignUpRepository {
    func signup(email: String, password: String, completion: @escaping (Response) -> Void)
}

class SignUpRepositoryImpl: SignUpRepository {
    func signup(email: String, password: String, completion: @escaping (Response) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            guard email.uppercased() != "test@error.com".uppercased() else {
                completion(.error(error: L10n.inputCorrectEmail))
                return
            }
            guard let data = Token.mockDataSuccess.data(using: .utf8),
                  let token: Token = self.decode(data: data) else {
                      completion(.error(error: L10n.unknownError))
                      return
                  }
            completion(.success(token: token))
        }
    }
    
    
    func decode<T>(data: Data) -> T? where T: Decodable{
        do {
            let d: T = try JSONDecoder().decode(T.self, from: data)
            return d
        } catch {
            return nil
        }
    }
    
}
