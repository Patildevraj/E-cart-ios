//
//  ApiHandler.swift
//  Feed Screen
//
//  Created by Kibbcom on 23/04/24.
//

import UIKit

class APIHandler: NSObject {
    fileprivate func returnParameter() -> [String:Any] {
        let parameter = [String:Any]()
////        parameter["apiKey"] = "ee45cdc492ec41e08eb6c9bb62f8d037"
//        parameter["sources"] = "techcrunch"
        return parameter
//        return [:]
    }
    static let shared = APIHandler()
    public func callProductsAPI(success: @escaping ((AllProducts) -> Void)) {
        APIManager.shared.callAPI(endPoint: ApiEndPoint.productList, parameter: returnParameter()) { response, error in
            if let response = response as? AllProducts {
//                print(response)
                success(response)
            } else {
                guard let error = error else {
                    print("Unknown error")
                    return
                }
                print("Response Error \(error.localizedDescription)")
            }
        }
    }
}
