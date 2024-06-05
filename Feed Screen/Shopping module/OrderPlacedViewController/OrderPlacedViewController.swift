//
//  OrderPlacedViewController.swift
//  Feed Screen
//
//  Created by Kibbcom on 02/04/24.
//

import UIKit
import Lottie

class OrderPlacedViewController: UIViewController {
    
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var subHeadLabel: UILabel!
    @IBOutlet weak var lottieAnimationView: UIView!
    
    let animationView = LottieAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.titleView?.tintColor = .white
        // Do any additional setup after loading the view.
        headLabel.text = "Your order has been placed successfully"
        headLabel.numberOfLines = 0
        subHeadLabel.text = "Sit and relax while your orders is being worked on. It will take 5 min before you get it"
        listButton.layer.cornerRadius = 12
        animationView.animation = LottieAnimation.named("lottieAnimation")
        animationView.frame.size = lottieAnimationView.frame.size
        animationView.contentMode = .scaleToFill
        lottieAnimationView.addSubview(animationView)
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
    }
    
    @IBAction func productListButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
//        self.navigationController?.popToViewController(newViewController, animated: true)
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

