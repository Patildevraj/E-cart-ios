//
//  CartPresenter.swift
//  Feed Screen
//
//  Created by Kibbcom on 06/05/24.
//

import Foundation
import UIKit

class CartPresenter: ViewToCartPresenterProtocol{
   
    var view: PresenterToCartViewProtocol?
    var router: PresenterToCartRouterProtocol?
    
    func showOrderPlacedViewController(_ viewController: UIViewController) {
        let router = CartRouter()
        router.pushToOrderPlacedViewControllerScreen(viewController)
    }
    
}
