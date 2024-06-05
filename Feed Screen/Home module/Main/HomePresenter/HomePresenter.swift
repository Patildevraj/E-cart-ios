//
//  HomePresenter.swift
//  Feed Screen
//
//  Created by Kibbcom on 30/04/24.
//

import Foundation
import UIKit

class HomePresenter: ViewToHomePresenterProtocol{
   
    var view: PresenterToHomeViewProtocol?
    var router: PresenterToHomeRouterProtocol?
    
    func showProductViewController(_ viewController: UIViewController) {
        router?.pushToProductViewControllerScreen(viewController)
    }
}

