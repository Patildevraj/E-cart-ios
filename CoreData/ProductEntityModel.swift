//
//  ProductEntityModel.swift
//  Feed Screen
//
//  Created by Kibbcom on 21/05/24.
//

import Foundation
import CoreData

//{
//  "id": 1,
//  "title": "iPhone 9",
//  "description": "An apple mobile which is nothing like apple",
//  "price": 549,
//  "discountPercentage": 12.96,
//  "rating": 4.69,
//  "stock": 94,
//  "brand": "Apple",
//  "category": "smartphones",
//  "thumbnail": "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg",
//  "images": [
//    "https://cdn.dummyjson.com/product-images/1/1.jpg",
//    "https://cdn.dummyjson.com/product-images/1/2.jpg",
//    "https://cdn.dummyjson.com/product-images/1/3.jpg",
//    "https://cdn.dummyjson.com/product-images/1/4.jpg",
//    "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg"
//  ]
//}

@objc(ProductEntityModel)
public class ProductEntityModel: NSManagedObject, Codable {
    @NSManaged public var id: Int
    @NSManaged public var title: String
    @NSManaged public var descriptionText: String
    @NSManaged public var price: Int
    @NSManaged public var discountPercentage: Double
    @NSManaged public var imagesData: NSData?
    
    var images: [String] {
        get {
            if let data = imagesData as Data? {
                return try! JSONDecoder().decode([String].self, from: data)
            }
            return []
        }
        set {
            imagesData = try? JSONEncoder().encode(newValue) as NSData
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case descriptionText = "description"
        case price
        case discountPercentage
        case images
    }
    
    
    required convenience public init(from decoder: Decoder) throws {
        // Obtain the managed object context
        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else {
            fatalError("Failed to decode ProductEntityModel")
        }
        
        // Initialize the entity
        let entity = NSEntityDescription.entity(forEntityName: "ProductEntityModel", in: context)!
        self.init(entity: entity, insertInto: context)
        
        // Decode the values
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        descriptionText = try container.decode(String.self, forKey: .descriptionText)
        price = try container.decode(Int.self, forKey: .price)
        discountPercentage = try container.decode(Double.self, forKey: .discountPercentage)
        images = try container.decode([String].self, forKey: .images)
        //        let imagesArray = try container.decode([String].self, forKey: .images)
        //        images = imagesArray.joined(separator: ",")
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(descriptionText, forKey: .descriptionText)
        try container.encode(price, forKey: .price)
        try container.encode(discountPercentage, forKey: .discountPercentage)
        try container.encode(images, forKey: .images)
        //        let imagesArray = images.components(separatedBy: ",")
        //        try container.encode(imagesArray, forKey: .images)
    }
        
}

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")
}
