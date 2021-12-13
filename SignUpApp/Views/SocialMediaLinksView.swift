//
//  SocialMediaLinksView.swift
//  SignUpApp
//
//  Created by Alex Mochalov on 14/12/2021.
//

import SwiftUI

struct SocialMediaLinksView: View {
    var body: some View {
        VStack(spacing: 20) {
            SocialMediaButton(title: L10n.continueWithFacebook, image: Image(Asset.Images.facebook.name))
            SocialMediaButton(title: L10n.continueWithGoogle, image: Image(Asset.Images.google.name))
            SocialMediaButton(title: L10n.continueWithApple, image: Image(Asset.Images.apple.name))
        }
    }
}

struct SocialMediaButton: View {
    
    var title: String
    var image: Image
    
    var body: some View {
        Button {
            
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.white)
                HStack(spacing: 15) {
                    self.image
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(self.title)
                        .textStyle(size: 15, weight: .semibold, color: Asset.Colors.black.color.toSuiColor)
                    Spacer()
                }
                .padding(.leading, 60)
            }
        }
        .frame(height: 48)
    }
}
