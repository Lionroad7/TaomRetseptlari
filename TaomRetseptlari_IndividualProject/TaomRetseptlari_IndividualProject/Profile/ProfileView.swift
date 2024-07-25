//
//  ProfileView.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 25/07/24.
//

import SwiftUI
import UIKit

struct ProfileView: View {
    @State private var name: String = UserDefaults.standard.string(forKey: "name") ?? ""
    @State private var image: UIImage? = {
        guard let imageData = UserDefaults.standard.data(forKey: "profileImage") else { return nil }
        return UIImage(data: imageData)
    }()
    @State private var showingImagePicker = false
    @State private var likedMeals: [String] = UserDefaults.standard.stringArray(forKey: "likedMeals") ?? []
    @State private var isEditMode: Bool = true
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                profileImage
                    .onTapGesture {
                        if isEditMode {
                            showingImagePicker = true
                        }
                    }

                nameView

                if isEditMode { saveButton }

                favoritesSection

                shareButton
                
                Spacer()
            }
            .background(Color.black.ignoresSafeArea())
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $image)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Success"), message: Text("Data successfully saved"), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private var profileImage: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            } else {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 120, height: 120)
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            }
        }
    }
    
    
    private var nameView: some View {
        Group {
            if isEditMode {
                TextField("Enter your name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .frame(maxWidth: 300)
            } else {
                Text(name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
    
    
    private var saveButton: some View {
        Button(action: saveProfile) {
            Text("Save")
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
    
    
    private var favoritesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("My Favorites")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.leading)
            
            List(likedMeals, id: \.self) { meal in
                Text(meal)
                    .padding(.vertical, 5)
                    .foregroundColor(.black)
                    .listRowBackground(Color.white)
            }
            .frame(height: 200)
            .background(Color.black)
            .cornerRadius(10)
        }
        .background(Color.black)
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
    
    private var shareButton: some View {
        Button(action: shareProfile) {
            Text("Share Profile")
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
    
    
    private func saveProfile() {
        UserDefaults.standard.set(name, forKey: "name")
        if let imageData = image?.jpegData(compressionQuality: 0.8) {
            UserDefaults.standard.set(imageData, forKey: "profileImage")
        }
        UserDefaults.standard.set(likedMeals, forKey: "likedMeals")
        isEditMode = false
        showAlert = true
    }
    
    private func shareProfile() {
        let text = "Check out my profile on FoodRecipes!"
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        
        if let window = UIApplication.shared.windows.first {
            window.rootViewController?.present(activityController, animated: true)
        }
    }
}

