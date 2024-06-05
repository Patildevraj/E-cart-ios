//
//  CartRouter.swift
//  Feed Screen
//
//  Created by Kibbcom on 06/05/24.
//

import Foundation
import UIKit

class CartRouter: PresenterToCartRouterProtocol{
    
    func pushToOrderPlacedViewControllerScreen(_ viewController: UIViewController) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Shopping", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "OrderPlacedViewController") as! OrderPlacedViewController
//        let nextViewController = CartRouter.createCartModule()
        viewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    static func createCartModule() -> CartViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        
        var presenter: ViewToCartPresenterProtocol = CartPresenter()
        let router: PresenterToCartRouterProtocol = CartRouter()
        
        presenter.view = view as? PresenterToCartViewProtocol
        presenter.router = router 

        view.presenter = presenter
            
        return view
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Shopping",bundle: Bundle.main)
    }
    
}
