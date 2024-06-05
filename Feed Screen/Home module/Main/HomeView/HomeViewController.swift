//
//  HomeViewController.swift
//  Feed Screen
//
//  Created by Kibbcom on 29/03/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var feedButton: UIButton!
    
    var presentor:ViewToHomePresenterProtocol?
    var isNavigating = false // Add this flag
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
    }
    
    func setUI(){
        navigationController?.navigationBar.backgroundColor = .red
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isNavigating = false // Reset the flag
    }
    
    @IBAction func feedScreenButton(_ sender: Any) {
        if !isNavigating { // Check the flag
            isNavigating = true // Set the flag
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "FeedScreenViewController") as! FeedScreenViewController
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
    
    @IBAction func shoppingScreenButton(_ sender: Any) {
        if !isNavigating { // Check the flag
            isNavigating = true // Set the flag
            presentor?.showProductViewController(self)
        }
//        presentor?.showProductViewController(self)
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
