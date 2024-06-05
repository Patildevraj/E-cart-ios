    //
    //  ProductPresenter.swift
    //  Feed Screen
    //
    //  Created by Kibbcom on 23/04/24.
    //

    import UIKit

class ProductViewControllerPresenter: ProductViewControllerToPresenterProtocol {
    
    var router: PresenterToRouterProtocol?
    var view: PresenterToProductViewControllerProtocol?
    var interactor: ProductViewControllerInteractorInputProtocol?
    
    func callCartView(navigationController: UINavigationController, products: [ProductEntityModel]) {
        router?.pushToCartViewControllerScreen(navigationController: navigationController, products: products)
    }
    
    func viewDidLoad() {
        let products = interactor?.fetchProductsFromCoreData() ?? []
        if products.isEmpty {
            interactor?.fetchProductsFromAPI()
        } else {
            view?.showProducts(products)
        }
    }
    
}

extension ProductViewControllerPresenter: ProductViewControllerInteractorOutputProtocol {
    func didFetchProducts(_ products: [ProductEntityModel]) {
        self.view?.showProducts(products)
    }
    
    func didFailWithError(_ error: any Error) {
        self.view?.showError(error.localizedDescription)
    }
}
