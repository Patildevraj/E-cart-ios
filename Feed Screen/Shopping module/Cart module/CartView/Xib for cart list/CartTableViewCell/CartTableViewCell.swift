//
//  CartTableViewCell.swift
//  Feed Screen
//
//  Created by Kibbcom on 01/04/24.
//

import UIKit

protocol CartTableViewCellDelegate: AnyObject {
    func didTapDeleteButton(cell: CartTableViewCell)
}

class CartTableViewCell: UITableViewCell {
    @IBOutlet weak var imageStack: UIStackView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var cartImage: UIImageView!
    @IBOutlet weak var cartTitle: UILabel!
    @IBOutlet weak var cartPrice: UILabel!
    
    weak var delegate: CartTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(){
        self.mainStack.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        mainStack.layer.borderWidth = 4
        mainStack.layer.cornerRadius = 20
        cartImage.layer.cornerRadius = 20
        cartTitle.font = UIFont(name: "Roboto-Bold", size: 18)
        cartTitle.numberOfLines = 0
    }
    
    func setData( _ cartProducts: ProductEntityModel){
        cartTitle.text = cartProducts.title
        
        let price = cartProducts.price
        cartPrice.text = "₹\(price)"
    
        if let imageString = cartProducts.images.first, let url = URL(string: imageString) {
            cartImage.downloadImage(from: url)
        }
    }

    
    @IBAction func deleteItem(_ sender: Any) {
        delegate?.didTapDeleteButton(cell: self)
    }
}

