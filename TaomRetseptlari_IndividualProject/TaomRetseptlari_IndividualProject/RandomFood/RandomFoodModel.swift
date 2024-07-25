//
//  RandomFoodModel.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//

import Foundation


struct RandomFoodMealResponse: Codable {
    let meals: [RandomFoodMeal]
}

struct RandomFoodMeal: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String?
    
    var id: String { idMeal }
}

struct RandomFoodCategoryResponse: Codable {
    let categories: [RandomFoodCategory]
}

struct RandomFoodCategory: Codable, Identifiable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String?
    let strCategoryDescription: String
    
    var id: String { idCategory }
}

struct RandomFoodDetailedMealResponse: Codable {
    let meals: [RandomFoodDetailedMeal]
}

struct RandomFoodDetailedMeal: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String?
    
    var id: String { idMeal }
}



