//
//  ProductCollectionViewCell.swift
//  Feed Screen
//
//  Created by Kibbcom on 28/03/24.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionViewCell: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productDiscountPrice: UILabel!
    @IBOutlet weak var productDiscountPercent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setUI() {
        layer.cornerRadius = 4
        productDiscountPercent.font = UIFont(name: "Roboto-thin", size: 16)
        productName.font = UIFont(name: "Roboto-Bold", size: 18)
        productName.numberOfLines = 0
        productDescription.numberOfLines = 0
    }
    
    func setData(_ products: ProductEntityModel) {
        productName.text = products.title
        
        let description = products.descriptionText.description
        productDescription.text = "\(description)"
        
        let price = products.price
        productPrice.text = "₹\(price)"
        
        let discountPercentage = products.discountPercentage
        productDiscountPercent.text = "\(discountPercentage)% 𝙊𝙛𝙛"
        
        if let imageString = products.images.first, let url = URL(string: imageString) {
            productImage.downloadImage(from: url)
        } 
    }
}
