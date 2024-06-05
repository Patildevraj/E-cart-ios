//
//  UIImageViewExtension.swift
//  Feed Screen
//
//  Created by Kibbcom on 15/04/24.
//
import UIKit

extension UIImageView {
    
    func downloadImage(from url: URL){
        contentMode = .scaleToFill
        let imageUrl = url // Use the provided URL directly

        image = UIImage(named: "temp")
        let dataTask = URLSession.shared.dataTask(with: imageUrl, completionHandler: {
            (data, response, error) in
            
            guard let httpUrlResponse = response as? HTTPURLResponse,
                  httpUrlResponse.statusCode == 200,
                  let mimeType = response?.mimeType,
                  mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else {
                return
            }
            DispatchQueue.main.async {
                self.image = image
                do{
                    try CoreDataStack.shared.saveContext()
                } catch {
                    print("Failed to save context: \(error.localizedDescription)")
                }

            }
            
        })
        dataTask.resume()
    }
}
