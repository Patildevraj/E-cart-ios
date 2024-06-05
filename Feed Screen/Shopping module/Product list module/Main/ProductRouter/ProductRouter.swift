//
//  ProductRouter.swift
//  Feed Screen
//
//  Created by Kibbcom on 23/04/24.
//

import Foundation
import UIKit

class ProductRouter:PresenterToRouterProtocol{
    
    func pushToCartViewControllerScreen(navigationController: UINavigationController, products: [ProductEntityModel]) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Shopping", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        newViewController.selectedItems = products
        navigationController.pushViewController(newViewController, animated: true)
    }
    
    static func createProductModule() -> ProductViewController {
                let view = mainstoryboard.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
       
                var presenter: ProductViewControllerToPresenterProtocol & ProductViewControllerInteractorOutputProtocol = ProductViewControllerPresenter()
                var interactor: ProductViewControllerInteractorInputProtocol = ProductViewControllerInteractor()
                let router:PresenterToRouterProtocol = ProductRouter()
      
                view.presenter = presenter
                presenter.view = view as? PresenterToProductViewControllerProtocol
                presenter.interactor = interactor
                presenter.router = router
                interactor.presenter = presenter
     
                return view
    }
    
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
    
