//
//  Category.swift
//  TaomRetseptlari_IndividualProject
//
//  Created by islombek on 24/07/24.
//

import Foundation

struct Category: Decodable, Identifiable {
    let id: String
    let name: String
    let imageUrlString: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case name = "strCategory"
        case imageUrlString = "strCategoryThumb"
        case description = "strCategoryDescription"
    }
}

struct CategoryResponse: Decodable {
    let categories: [Category]
}

