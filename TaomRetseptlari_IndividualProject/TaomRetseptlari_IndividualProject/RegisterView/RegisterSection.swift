//
//  RegisterSection.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "chefhat.and.spoon")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            Text("Mening Oshxonam")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text("Men bilan hammasi oson")
                .font(.subheadline)
                .foregroundColor(.white)
            Text("Kirish")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

struct CustomTextField: View {
    let imageName: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.white)
            TextField(placeholder, text: $text)
                .padding()
                .background(Color.white)
                .cornerRadius(9)
                .foregroundColor(.black)
        }
    }
}

struct CustomSecureField: View {
    let imageName: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.white)
            SecureField(placeholder, text: $text)
                .padding()
                .background(Color.white)
                .cornerRadius(9)
                .foregroundColor(.black)
        }
    }
}

struct ForgotPasswordButton: View {
    var body: some View {
        Button(action: {
          
        }) {
            Text("Parolni unutdingizmi?")
                .foregroundColor(.orange)
        }
    }
}

struct LoginButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Kirish")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .cornerRadius(10.0)
        }
    }
}

