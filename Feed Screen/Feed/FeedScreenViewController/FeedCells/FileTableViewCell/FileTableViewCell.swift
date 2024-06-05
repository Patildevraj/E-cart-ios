//
//  FileTableViewCell.swift
//  Feed Screen
//
//  Created by Kibbcom on 22/03/24.
//

import UIKit

class FileTableViewCell: UITableViewCell {

    @IBOutlet weak var fileView: UIView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var leftStack: UIStackView!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var rightStack: UIStackView!
    @IBOutlet weak var docStack: UIStackView!
    @IBOutlet weak var fileImage: UIImageView!
    @IBOutlet weak var fileTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dateLabel.text = formatter.string(from: Date())
        
        // Initialization code
        selectionStyle = .none
        fileView.layer.cornerRadius = 12
        docStack.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
