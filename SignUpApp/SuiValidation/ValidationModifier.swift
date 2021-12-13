//
//  ValidationModifier.swift
//  NettellerComponents
//
//  Created by Alexander on 08/10/2021.
//  Copyright © 2021 NetInfo plc. All rights reserved.
//

import SwiftUI
import Combine

public struct ValidationModifier<ErrorContent>: ViewModifier where ErrorContent: View {
    
    @State var latestValidation: Validation = .success
    @State var errorBorderColor: Color = .clear
    @Binding var showError: Bool
    let validationPublisher: ValidationPublisher
    var errorLabel: (String) -> ErrorContent
  
    public init(validationPublisher: ValidationPublisher, showError: Binding<Bool>, @ViewBuilder errorLabel: @escaping (String) -> ErrorContent) {
        self.validationPublisher = validationPublisher
        self._showError = showError
        self.errorLabel = errorLabel
    }

    
    public func body(content: Content) -> some View {
        VStack {
            content
            self.error
        }
        .onReceive(validationPublisher) { validation in
            self.latestValidation = validation
        }
    }
    
    var error: some View {
        switch self.latestValidation {
        case .success:
            return AnyView(EmptyView())
        case .failure(message: let message):
            if self.showError {
                let view = self.errorLabel(message)
                return AnyView(view)
            } else {
                return AnyView(EmptyView())
            }
        }
    }
}

public extension View {
    func validation<ErrorContent>(validationPublisher: ValidationPublisher, showError: Binding<Bool>, @ViewBuilder content: @escaping (String) -> ErrorContent) -> some View where ErrorContent: View {
        self.modifier(ValidationModifier(validationPublisher: validationPublisher, showError: showError, errorLabel: content))
    }
    
}
