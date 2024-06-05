//
//  CartProtocol.swift
//  Feed Screen
//
//  Created by Kibbcom on 06/05/24.
//

import Foundation
import UIKit

protocol ViewToCartPresenterProtocol{
    
    var view: PresenterToCartViewProtocol? { get set}
    var router: PresenterToCartRouterProtocol? { get set}
    
//    func showConfirmationPage()
    func showOrderPlacedViewController(_ viewController: UIViewController)
}

protocol PresenterToCartViewProtocol{
    var presenter: ViewToCartPresenterProtocol? { get set}
    
    
}

protocol PresenterToCartRouterProtocol {
    static func createCartModule()-> CartViewController
    func pushToOrderPlacedViewControllerScreen(_ viewController: UIViewController)
}

protocol CartUpdateDelegate: AnyObject {
    func didUpdateCart()
}
