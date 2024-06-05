//
// CartViewController.swift
//  Feed Screen
//
//  Created by Kibbcom on 01/04/24.
//

import UIKit
import UserNotifications

class CartViewController: UIViewController, CartUpdateDelegate {
    
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var pleaseAddView: UIView!
    @IBOutlet weak var cartTableView: UITableView!
    
    var presenter:ViewToCartPresenterProtocol?
    
    let center = UNUserNotificationCenter.current()
    var selectedItems = [ProductEntityModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        presenter.self = CartPresenter()
    }
    
    func setUI(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Cart Page"
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "cartCell")
    }
    
    func scheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "@Shopping App"
        content.body = "Order Placed Successfully"
        content.categoryIdentifier = "orderNotification"
        
//        let date = Date().addingTimeInterval(1)
//        let dateComponent = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: date)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        center.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("----- Notification scheduled successfully ----")
            }
        }
    }
    
    func didUpdateCart() {
        // Update cart state based on selectedItems
        if selectedItems.isEmpty {
            placeOrderButton.isHidden = true
            pleaseAddView.isHidden = false
        } else {
            placeOrderButton.isHidden = false
            pleaseAddView.isHidden = true
        }
    }
    
    @IBAction func placeOrder(_ sender: Any) {
        cartTableView.isHidden = true 
        pleaseAddView.isHidden = false
        scheduleNotification()
        presenter?.showOrderPlacedViewController(self)
    }
}

extension CartViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        cell.setData(selectedItems[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPatxh: IndexPath) -> CGFloat {
        return 125
    }
}

extension CartViewController: CartTableViewCellDelegate {
    func didTapDeleteButton(cell: CartTableViewCell) {
        if let indexPath = cartTableView.indexPath(for: cell) {
            selectedItems.remove(at: indexPath.row)
            didUpdateCart()
            cartTableView.reloadData()
        }
    }
}


