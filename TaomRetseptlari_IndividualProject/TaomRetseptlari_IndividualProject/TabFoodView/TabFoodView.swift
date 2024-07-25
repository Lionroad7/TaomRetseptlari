//
//  TabFoodView.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//

import SwiftUI

struct TabFoodView: View {
    @State private var searchText = ""
   
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    RandomFoodView()
                        .padding(.top, -15)
                    
                    NavigationLink(destination: FoodFeedView()) {
                        VideoPlayerView()
                            .frame(width: 380, height: 450)
                            .padding(.top, -43)
                    }
                }
            }
            .background(Color.black)
        }
        .navigationBarHidden(true)
        .padding(.horizontal, -10)
    }
}




