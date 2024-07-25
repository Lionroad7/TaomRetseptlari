//
//  ContentView.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false


    var body: some View {
        ZStack {
            BackgroundView(imageName: "ovqat_image")
            
            VStack(spacing: 20) {
                Spacer()
                
                LogoView()
                
                VStack(spacing: 15) {
                    CustomTextField(imageName: "envelope", placeholder: "Email Address", text: $email)
                    CustomSecureField(imageName: "lock", placeholder: "Password", text: $password)
                    HStack { Spacer(); ForgotPasswordButton() }
                }
                
                NavigationLink(destination: TabbarView(), isActive: $isLoggedIn) {
                    LoginButton(action: loginAction)
                }
                .isDetailLink(false)
                
                SocialLoginButtons().padding(.top, 10)
                
                Spacer()
                
                RegisterView().padding(.bottom, 20)
            }
            .padding(.horizontal, 80)
        }
    }

    private func loginAction() {
        // Login Logic Here
        isLoggedIn = true
    }
}

