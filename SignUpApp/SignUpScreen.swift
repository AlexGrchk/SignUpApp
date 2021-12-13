//
//  ContentView.swift
//  SignUpApp
//
//  Created by Alex Mochalov on 13/12/2021.
//

import SwiftUI

struct SignUpScreen: View {
    
    @ObservedObject private var viewModel: SignUpViewModel = .init()
    
    @State private var isButtonDisabled: Bool = true
    @State private var showError: Bool = false
    @State private var showSuccess: Bool = false
    
    var body: some View {
        ZStack {
            NavigationLink(isActive: self.$showSuccess, destination: {
                Text("Main feed")
            }, label: {
                EmptyView()
            })
            Asset.Colors.background.color.toSuiColor
                .ignoresSafeArea()
            VStack(spacing: 25) {
                VStack(spacing: 40) {
                    self.topCloseButtonView
                    Text(L10n.createAnAccount)
                        .textStyle(size: 16, weight: .bold, color: Asset.Colors.black.color.toSuiColor)
                }
                VStack(spacing: 30) {
                    AppInputView(title: L10n.emailAddress, text: self.$viewModel.email, isSecured: false)
                    AppInputView(title: L10n.password, text: self.$viewModel.password, isSecured: true)
                    if self.viewModel.isLoadingData {
                        ActivityIndicator(isLoading: self.$viewModel.isLoadingData)
                    } else {
                        self.submitButton
                    }
                }
                VStack(spacing: 40) {
                    self.alreadyHaveAccountButton
                    Divider()
                    SocialMediaLinksView()
                }
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .onReceive(self.viewModel.$errorMessage, perform: { error in
            if error != nil {
                self.showError = true
            }
        })
        .onReceive(self.viewModel.formValidator) { validation in
            self.isButtonDisabled = !validation.isSuccess
        }
        .onReceive(self.viewModel.successfulSignupSubject) { _ in
            self.showSuccess = true
        }
        .alert(isPresented: self.$showError) {
            Alert(title: Text(L10n.error), message: Text(self.viewModel.errorMessage ?? ""), dismissButton: .default(Text(L10n.ok)))
        }
    }
    
    var topCloseButtonView: some View {
        HStack {
            Image(systemName: SFSymbols.close)
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(Asset.Colors.gray.color.toSuiColor)
            Spacer()
            Text(L10n.later)
                .textStyle(size: 14, weight: .regular, color: Asset.Colors.gray.color.toSuiColor)
        }
        .padding(.top)
    }
    
    var alreadyHaveAccountButton: some View {
        Button {
            
        } label: {
            Text(L10n.alreadyHaveAnAccountQuestion)
                .textStyle(size: 13, weight: .regular, color: Asset.Colors.gray.color.toSuiColor)
        }
    }
    
    var submitButton: some View {
        Button {
            self.viewModel.submit()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(self.buttonBackground)
                Text(L10n.createAnAccountButton)
                    .textStyle(size: 15, weight: .semibold, color: Asset.Colors.black.color.toSuiColor.opacity(self.isButtonDisabled ? 0.5 : 1.0))
            }
            .frame(height: 48)
        }
        .disabled(self.isButtonDisabled)

    }
    
    var buttonBackground: Color {
        self.isButtonDisabled ? Asset.Colors.primaryYellow.color.toSuiColor.opacity(0.5) : Asset.Colors.primaryYellow.color.toSuiColor
    }
}


struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
