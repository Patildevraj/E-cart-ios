//
//  ProductProtocol.swift
//  Feed Screen
//
//  Created by Kibbcom on 23/04/24.
//

import UIKit

protocol PresenterToProductViewControllerProtocol {
    func showProducts(_ products: [ProductEntityModel])
    func showError(_ message: String)
}

protocol ProductViewControllerInteractorInputProtocol {
    var presenter: ProductViewControllerInteractorOutputProtocol? { get set }
    func fetchProductsFromAPI()
    func fetchProductsFromCoreData() -> [ProductEntityModel]
}

protocol ProductViewControllerInteractorOutputProtocol {
    func didFetchProducts(_ products: [ProductEntityModel])
    func didFailWithError(_ error: Error)
}

protocol ProductViewControllerToPresenterProtocol{
    var view: PresenterToProductViewControllerProtocol? { get set }
    var interactor: ProductViewControllerInteractorInputProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    func viewDidLoad()
    func callCartView(navigationController: UINavigationController, products: [ProductEntityModel])
}

protocol PresenterToRouterProtocol {
    static func createProductModule()-> ProductViewController
    func pushToCartViewControllerScreen(navigationController: UINavigationController, products: [ProductEntityModel])
}























//protocol ProductViewControllerToPresenterProtocol {
//    var view: PresenterToProductViewControllerProtocol? {get set}
//    var router: PresenterToRouterProtocol? {get set}
//    var interactor: ProductViewControllerInteractorInputProtocol? { get set }
//    
//    // VIEW -> PRESENTER
//    func fetchProducts(completion: @escaping (AllProducts?, Error?) -> Void)
//    func coreDataInteractor(_ products: [Products])
//    func callCartView(navigationController: UINavigationController, products: [Products])
//    func showProductsList( _ products: [Products])
////    func fetchProductsFromCoreData(completion: @escaping (NewProductEntity?, Error?) -> Void)
//    
//}
//
//protocol PresenterToProductViewControllerProtocol {
//    var presenter: ProductViewControllerToPresenterProtocol? { get set}
//    
//    // PRESENTER -> VIEW
//    func showProducts(show: [Products])
//    
//}
//
//protocol PresenterToRouterProtocol {
//    static func createProductModule()-> ProductViewController
//    func pushToCartViewControllerScreen(navigationController: UINavigationController, products: [Products])
//}
//
//protocol ProductViewControllerInteractorInputProtocol{
//    var presenter: ProductViewControllerInteractorOutputProtocol? { get set}
//    
//    // PRESENTER -> INTERACTOR
//    func fetchProducts(completion: @escaping (AllProducts?, Error?) -> Void)
//    func coreDataInteractor(_ products: [Products])
//    func fetchProductsFromCoreData(completion: @escaping ([NewProductEntity]?, Error?) -> Void)
//}
//
//protocol ProductViewControllerInteractorOutputProtocol {
//    var interactor: ProductViewControllerInteractorInputProtocol? { get set }
//    // INTERACTOR -> PRESENTER
//    
//    func didFetchProductsFromCoreData(_ products: [NewProductEntity])
//    func coreDataInteractor(_ products: [Products])
////    func didRetrieveProducts(_ products: [Products])
//    func onError()
//}

    
