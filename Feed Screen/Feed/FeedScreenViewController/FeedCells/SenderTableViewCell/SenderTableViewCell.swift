//
//  SenderTableViewCell.swift
//  Feed Screen
//
//  Created by Kibbcom on 21/03/24.
//

import UIKit

class SenderTableViewCell: UITableViewCell {

    @IBOutlet weak var senderStack: UIStackView!
    @IBOutlet weak var leftStack: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var rightStack: UIStackView!
    @IBOutlet weak var msgImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dateLabel.text = formatter.string(from: Date())
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
