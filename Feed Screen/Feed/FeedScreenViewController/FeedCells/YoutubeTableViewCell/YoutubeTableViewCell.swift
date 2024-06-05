//
//  YoutubeTableViewCell.swift
//  Feed Screen
//
//  Created by Kibbcom on 25/03/24.
//

import UIKit
import WebKit

class YoutubeTableViewCell: UITableViewCell {

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var viewTube: WKWebView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var leftStack: UIStackView!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var rightStack: UIStackView!
    @IBOutlet weak var dateTitleStack: UIStackView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var noteStack: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dateLabel.text = formatter.string(from: Date())
        
        selectionStyle = .none
        // Initialization code
        let videoId = "M7lc1UVf-VE"
        let url = URL(string: "https://www.youtube.com/embed/\(videoId)")
        let request = URLRequest(url: url!)
        viewTube.layer.cornerRadius = 12
        viewTube.load(request)
        mainStack.layer.cornerRadius = 12
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
