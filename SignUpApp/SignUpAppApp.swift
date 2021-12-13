//
//  SignUpAppApp.swift
//  SignUpApp
//
//  Created by Alex Mochalov on 13/12/2021.
//

import SwiftUI

@main
struct SignUpAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SignUpScreen()
                    .navigationBarHidden(true)
            }
        }
    }
}
