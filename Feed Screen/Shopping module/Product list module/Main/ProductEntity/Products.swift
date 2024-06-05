////
////  Products.swift
////  Feed Screen
////
////  Created by Kibbcom on 15/04/24.
////
//
//import Foundation
//
//struct Products : Codable {
//    let id : Int?
//    let title : String?
//    let description : String?
//    let price : Int?
//    let discountPercentage : Double?
//    let images : [String]?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case title = "title"
//        case description = "description"
//        case price = "price"
//        case discountPercentage = "discountPercentage"
//        case images = "images"
//    }
//   
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        title = try values.decodeIfPresent(String.self, forKey: .title)
//        description = try values.decodeIfPresent(String.self, forKey: .description)
//        price = try values.decodeIfPresent(Int.self, forKey: .price)
//        discountPercentage = try values.decodeIfPresent(Double.self, forKey: .discountPercentage)
//        images = try values.decodeIfPresent([String].self, forKey: .images)
//    }
//
//}
