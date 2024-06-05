//
//  HomeProtocol.swift
//  Feed Screen
//
//  Created by Kibbcom on 30/04/24.
//

import Foundation
import UIKit

protocol ViewToHomePresenterProtocol{
    
    var view: PresenterToHomeViewProtocol? { get set}
    var router: PresenterToHomeRouterProtocol? { get set}
    
    func showProductViewController(_ viewController: UIViewController)
    
}

protocol PresenterToHomeViewProtocol{
}

protocol PresenterToHomeRouterProtocol {
    static func createHomeModule()-> HomeViewController
    func pushToProductViewControllerScreen(_ viewController: UIViewController)
}

//protocol PresenterToHomeInteractorProtocol {
//    
//}
//
//protocol InteractorToHomePresenterProtocol {
//    
//}
