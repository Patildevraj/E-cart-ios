//
//  ImageTableViewCell.swift
//  Feed Screen
//
//  Created by Kibbcom on 22/03/24.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var personCell: UIImageView!
    @IBOutlet weak var rightStack: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleDateStack: UIStackView!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dateLabel.text = formatter.string(from: Date())
        
        selectionStyle = .none
        viewImage.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
