//
//  TabbarView.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//

import SwiftUI


struct TabbarView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                switch selectedIndex {
                case 0:
                    TabFoodView()
                case 1:
                    ProfileView()
                default:
                    TabFoodView()
                }
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)

            HStack {
                TabBarItem(title: "Food", imageName: "fork.knife", isSelected: selectedIndex == 0) {
                    selectedIndex = 0
                }
                TabBarItem(title: "Profile", imageName: "person.circle", isSelected: selectedIndex == 1) {
                    selectedIndex = 1
                }
            }
            .frame(height: 170)
            .padding(.horizontal)
            .padding(.vertical, -30)
            .background(
                Image("tabimage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(Color.black.opacity(0.2))
            )
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.bottom, -35)
        }
    }
}

struct TabBarItem: View {
    let title: String
    let imageName: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: imageName)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(isSelected ? .white : .white)
                Text(title)
                    .font(.caption)
                    .foregroundColor(isSelected ? .white : .white)
            }
            .padding(.vertical, 1)
            .frame(maxWidth: .infinity)
            .background(isSelected ? Color.orange : Color.clear)
            .cornerRadius(25)
        }
    }
}

