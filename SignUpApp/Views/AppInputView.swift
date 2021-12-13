//
//  AppInputView.swift
//  SignUpApp
//
//  Created by Alex Mochalov on 14/12/2021.
//

import SwiftUI

struct AppInputView: View {
    
    var title: String
    @Binding var text: String
    var isSecured: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.white)
            VStack {
                if self.isSecured {
                    SecureField(self.title, text: self.$text)
                } else {
                    TextField(self.title, text: self.$text)
                }
            }
            .padding()
        }
        .frame(height: 50)
    }
}
