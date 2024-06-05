//
//  HomeRouter.swift
//  Feed Screen
//
//  Created by Kibbcom on 30/04/24.
//

import Foundation
import UIKit

class HomeRouter:PresenterToHomeRouterProtocol{
    
    func pushToProductViewControllerScreen(_ viewController: UIViewController) {
        let nextViewController = ProductRouter.createProductModule()
        viewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    static func createHomeModule() -> HomeViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        var presenter: ViewToHomePresenterProtocol = HomePresenter()
        let router: PresenterToHomeRouterProtocol = HomeRouter()
        
        view.presentor = presenter
        presenter.view = view as? any PresenterToHomeViewProtocol
        presenter.router = router
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
