//
//  ActivityIndicator.swift
//  SignUpApp
//
//  Created by Alex Mochalov on 13/12/2021.
//

import SwiftUI


struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var isLoading: Bool
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.isHidden = !self.isLoading
        if self.isLoading {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView()
        view.style = .medium
        view.tintColor = Asset.Colors.primaryYellow.color
        return view
    }
}
