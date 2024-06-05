//
//  FeedScreenViewController.swift
//  Feed Screen
//
//  Created by Kibbcom on 28/03/24.
//

import UIKit

class FeedScreenViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var titles = ["Sumit", "Siba", "Shelly", "Devraj", "Admin"]
    var notes = [ "This is my image","Hii.. how are you ....where are you..... ?", "This is my document", "Hello...","This is my video" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "SenderTableViewCell", bundle: nil), forCellReuseIdentifier: "senderCell")
        tableView.register(UINib(nibName: "MyCellTableViewCell", bundle: nil), forCellReuseIdentifier: "myCell")
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
        tableView.register(UINib(nibName: "FileTableViewCell", bundle: nil), forCellReuseIdentifier: "fileCell")
        tableView.register(UINib(nibName: "YoutubeTableViewCell", bundle: nil), forCellReuseIdentifier: "youtubeCell")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FeedScreenViewController : UITableViewDelegate, UITableViewDataSource{
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "Image section"
//        } else if section == 1{
//            return "Sender messsage section"
//        } else if section == 2{
//            return "File section"
//        } else if section == 3{
//            return "Messsage section"
//        } else {
//            return "Document section"
//        }
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else {
            return 2
        }
//        if section == 0 {
//            return 1
//        }  else if section == 1 {
//            return 1
//        } else if section == 2 {
//            return 1
//        } else if section == 3 {
//            return 1
//        }else {
//            return 1
//        }
        
//        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageTableViewCell
                imageCell.titleLabel.text = titles[indexPath.row]
                imageCell.titleLabel.numberOfLines = 0
                imageCell.noteLabel.text = notes[indexPath.row]
                imageCell.noteLabel.numberOfLines = 0
                imageCell.viewImage.layer.borderWidth = 0.5
                imageCell.mainImage.layer.cornerRadius = 8
                return imageCell
            } else if indexPath.row == 2 {
                let fileCell = tableView.dequeueReusableCell(withIdentifier: "fileCell", for: indexPath) as! FileTableViewCell
                fileCell.titleLabel.text = titles[indexPath.row]
                fileCell.titleLabel.numberOfLines = 0
                fileCell.noteLabel.text = notes[indexPath.row]
                fileCell.noteLabel.numberOfLines = 0
                fileCell.fileTitle.text = "Document"
                fileCell.fileView.layer.borderWidth = 0.5
                return fileCell
            }  else if indexPath.row == 4 {
                let youtubeCell = tableView.dequeueReusableCell(withIdentifier: "youtubeCell", for: indexPath) as! YoutubeTableViewCell
                youtubeCell.titleLabel.text = titles[indexPath.row]
                youtubeCell.titleLabel.numberOfLines = 0
                youtubeCell.noteLabel.text = notes[indexPath.row]
                youtubeCell.noteLabel.numberOfLines = 0
                youtubeCell.videoView.layer.cornerRadius = 12
                youtubeCell.viewTube.layer.cornerRadius = 8
                youtubeCell.videoView.layer.borderWidth = 0.5
                return youtubeCell
            } else {
                let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCellTableViewCell
                myCell.titleLabel.text = titles[indexPath.row]
                myCell.myStack.layer.borderWidth = 0.5
                myCell.msgLabel.text = notes[indexPath.row]
                myCell.myStack.layer.cornerRadius = 12
                return myCell
            }
        } else {
            let senderCell = tableView.dequeueReusableCell(withIdentifier: "senderCell", for: indexPath) as! SenderTableViewCell
            senderCell.titleLabel.text = titles[indexPath.row]
            senderCell.msgLabel.text = notes[indexPath.row]
            senderCell.senderStack.layer.borderWidth = 0.5
            senderCell.senderStack.layer.cornerRadius = 12
            senderCell.rightStack.alignment = .trailing
            return senderCell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
           navigateToPage(selectImage: "Highway")
        } else if indexPath.section == 0 && indexPath.row == 4 {
            navigateToPage(selectImage: URL(string: "https://www.youtube.com/embed/M7lc1UVf-VE")!)
        }
        else if indexPath.section == 0 && indexPath.row == 2 {
            navigateToPage(selectImage: URL(string: "https://css4.pub/2015/textbook/somatosensory.pdf") as Any)
        }
    }
    
    private func navigateToPage(selectImage: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "PreviewViewController") as? PreviewViewController else { return }
        vc.image = selectImage
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

