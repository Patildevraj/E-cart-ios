//
//  AllProducts.swift
//  Feed Screen
//
//  Created by Kibbcom on 15/04/24.
//

import Foundation

struct AllProducts: Codable {
    var products: [ProductEntityModel]?
    var total: Int?
    var skip: Int?
    var limit: Int?
    enum CodingKeys: String, CodingKey {
        case products = "products"
        case total = "total"
        case skip = "skip"
        case limit = "limit"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        products = try values.decodeIfPresent([ProductEntityModel].self, forKey: .products)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        skip = try values.decodeIfPresent(Int.self, forKey: .skip)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
    }
}
