//
//  ProductInteractor.swift
//  Feed Screen
//
//  Created by Kibbcom on 23/04/24.
//

import Foundation
import CoreData

class ProductViewControllerInteractor: ProductViewControllerInteractorInputProtocol {
    
    var presenter: ProductViewControllerInteractorOutputProtocol?
    
    func fetchProductsFromAPI() {
        let url = URL(string: "https://dummyjson.com/products")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Failed to fetch data: \(error?.localizedDescription ?? "No error description")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.userInfo[CodingUserInfoKey.context!] = CoreDataStack.shared.context
                
                let decodedProducts = try decoder.decode(AllProducts.self, from: data)
                                
                // Save to Core Data
                try CoreDataStack.shared.saveContext()
                                
                // Notify the presenter with the fetched products
                self.presenter?.didFetchProducts(decodedProducts.products ?? [])

            } catch {
                print("Failed to decode JSON or save context: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    func fetchProductsFromCoreData() -> [ProductEntityModel] {
        let context = CoreDataStack.shared.context
        let fetchRequest: NSFetchRequest<ProductEntityModel> = ProductEntityModel.fetchRequest() as! NSFetchRequest<ProductEntityModel>
        
        do {
            let products = try context.fetch(fetchRequest)
            return products
        } catch {
            print("Failed to fetch products from Core Data: \(error.localizedDescription)")
            return []
        }
    }
    
}
    
    
    
    
    
    
    
//    func fetchProducts(completion: @escaping (AllProducts?, Error?) -> Void) {
//        let url = URL(string: "https://dummyjson.com/products")!
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                do {
//                    let decodedProducts = try JSONDecoder().decode(AllProducts.self, from: data)
//                    completion(decodedProducts, nil)
////                    print("decoded data - \(decodedProducts)")
//                } catch {
//                    completion(nil, error)
//                }
//            } else if let error = error {
//                completion(nil, error)
//            }
//        }
//        task.resume()
//    }
//    
//
//    func coreDataInteractor(_ products: [Products] ){
//        //         Save products to CoreData
//        let context = CoreDataStack.sharedCD.persistentContainer.viewContext
//        
////        context.perform {
//            products.forEach{ product in
//                let productEntity = NewProductEntity(context: context)
//                productEntity.id = Int64(Int(product.id ?? 0))
//                productEntity.title = product.title ?? ""
//                productEntity.price = Int64(Int(product.price ?? 0))
//                productEntity.discountPercentage = product.discountPercentage ?? 0
//                productEntity.descriptionText = product.description ?? ""
//                productEntity.images = product.images?.joined(separator: ",")
//            }
//            //        print("core data products - \(products)")
//            
//            CoreDataStack.sharedCD.saveContext()
//            //        self.presenter?.didRetrieveProducts(products)
////        }
//    }
//    
//    func fetchProductsFromCoreData(completion: @escaping ([NewProductEntity]?, Error?) -> Void) {
////        let fetchRequest: NSFetchRequest<NewProductEntity> = NewProductEntity.fetchRequest()
//        
//        do {
//            let products = try CoreDataStack.sharedCD.persistentContainer.viewContext.fetch(fetchRequest)
//            print("Local storage - \(products)")
//            completion(products, nil)
//        } catch {
//            completion(nil, error)
//        }
//    }
//    
    
