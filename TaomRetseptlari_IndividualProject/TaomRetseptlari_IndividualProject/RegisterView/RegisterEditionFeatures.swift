//
//  RegisterEditionFeatures.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//

import SwiftUI

struct BackgroundView: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .overlay(Color.black.opacity(0.4))
    }
}


struct SocialLoginButtons: View {
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
            }) {
                Image("google_icon")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            Button(action: {
            }) {
                Image("facebook_icon")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }
    }
}

struct RegisterView: View {
    var body: some View {
        HStack {
            Text("Men bu yerda yangiman")
                .foregroundColor(.white)
            Button(action: {
            }) {
                Text("Kirishni xohlayman")
                    .foregroundColor(.orange)
                    .fontWeight(.bold)
            }
        }
    }
}

