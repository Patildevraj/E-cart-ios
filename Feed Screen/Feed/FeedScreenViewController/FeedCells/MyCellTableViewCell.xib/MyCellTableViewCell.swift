//
//  MyCellTableViewCell.swift
//  Feed Screen
//
//  Created by Kibbcom on 21/03/24.
//

import UIKit

class MyCellTableViewCell: UITableViewCell {

    @IBOutlet weak var myStack: UIStackView!
    @IBOutlet weak var rightStack: UIStackView!
    @IBOutlet weak var leftStack: UIStackView!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var msgImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dateLabel.text = formatter.string(from: Date())
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
