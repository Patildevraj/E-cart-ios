//
//  APIManager.swift
//  Feed Screen
//
//  Created by Kibbcom on 23/04/24.
//

import Foundation

enum APIMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

class APIManager: NSObject{
    static let shared = APIManager()
    var request: URLRequest?
    public var baseURL: String! {
        return "https://dummyjson.com/"
    }
    func callAPI(endPoint: (String, APIMethod), parameter: [String:Any]? = nil, completion: @escaping (_ response: Any?, _ error: Error?) -> Void ){
        guard let directUrl = URL(string: baseURL + endPoint.0) else { return }
        let method = endPoint.1
        if let parameter = parameter {
            if var uRLComponents = URLComponents(url: directUrl, resolvingAgainstBaseURL: false) {
                var queryItems = [URLQueryItem]()
                for (paramName, paramValue) in parameter {
                    queryItems.append(URLQueryItem(name: paramName, value: "\(paramValue)"))
                }
                uRLComponents.queryItems = queryItems
//                uRLComponents.percentEncodedQuery = uRLComponents.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
                if let requestURL = uRLComponents.url {
                    request = URLRequest(url: requestURL )
                } else {
                    request = URLRequest(url: directUrl)
                }
            }
        } else {
            request = URLRequest(url: directUrl)
        }
        request?.httpMethod = method.rawValue
        guard let apiRequest = request else { return }
        makeAPICalls(apiRequest, completion: completion)
    }
    func makeAPICalls(_ request:URLRequest, completion: ((_ response: Any?, _ error: Error?) -> Void)? = nil) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion?(nil, error)
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                let decodeData = try JSONDecoder().decode(AllProducts.self, from: data)
                completion?(decodeData, nil)
            } catch {
                completion?(nil, error)
                print("Error decoding data: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
}
