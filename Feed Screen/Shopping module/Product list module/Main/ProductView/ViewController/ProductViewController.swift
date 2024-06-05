//
//  ProductViewController.swift
//  Feed Screen
//
//  Created by Kibbcom on 28/03/24.
//

import UIKit
import UserNotifications
import CoreData

class ProductViewController: UIViewController, PresenterToProductViewControllerProtocol{
 
    
  
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var adcView: UIView!
    @IBOutlet weak var itemsCount: UILabel!
    @IBOutlet weak var popupPrice: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
                
    var presenter: ProductViewControllerToPresenterProtocol?
    
    var products:[ProductEntityModel] = []
    
    weak var cartUpdateDelegate: CartUpdateDelegate?
    var selectedItems = [ProductEntityModel]()
    var totalPrice = ""
    // Set the spacing between items
    let cellSpacing: CGFloat = 10
    let leftSpacing: CGFloat = 10
    let rightSpacing: CGFloat = 10
    let topSpacing: CGFloat = 10
    let bottomSpacing: CGFloat = 10
    // Set the number of items in a row
    let itemsPerRow = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        presenter?.viewDidLoad()
    }
    
    func showProducts(_ products: [ProductEntityModel]) {
        activityIndicator.startAnimating()
        self.products = products
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
    
    func showError(_ message: String) {
        print("not able to show product")
    }
        
    func setUI(){
        // Do any additional setup after loading the view.
        activityIndicator.startAnimating()
        collectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsMultipleSelection = true
        adcView.layer.cornerRadius = 12
    }
    
    @IBAction func addToCart(_ sender: Any) {
        adcView.isHidden = true
        
        if let selectedIndexPaths = collectionView.indexPathsForSelectedItems {
            for indexPath in selectedIndexPaths {
                if let cell = collectionView.cellForItem(at: indexPath) as? ProductCollectionViewCell {
                    cell.layer.borderWidth = 0
                    cell.contentView.layer.borderColor = UIColor.clear.cgColor
                }
            }
        }
        
        presenter?.callCartView(navigationController: navigationController!, products: selectedItems)
        selectedItems.removeAll()
    }
}
    

extension ProductViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell()}
        let product = products[indexPath.item]
        cell.setData(product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ProductCollectionViewCell{
            cell.layer.borderWidth = 0.7
            cell.contentView.layer.borderColor = UIColor.blue.cgColor
        }
        
        if selectedItems.contains(where: { $0.id == products[indexPath.item].id }) {
            selectedItems = selectedItems.filter({ product in
                return products[indexPath.item].id != product.id
            })
        }else {
            selectedItems.append(products[indexPath.item])
        }
        updateItemsCount()
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn) {
            self.adcView.isHidden = self.selectedItems.isEmpty
        }
    }
    
    private func updateItemsCount() {
        var totalSelectedPrice = 0

        selectedItems.forEach { product in
            let price = product.price
                totalSelectedPrice += price
            
        }
        if selectedItems.count == 0{
            adcView.isHidden = true
        }
        itemsCount.text = "\(selectedItems.count) items selected"
        popupPrice.text = "₹\(totalSelectedPrice)"
//        print(totalSelectedPrice)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ProductCollectionViewCell{
            cell.layer.borderWidth = 0
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
        }
        
        if let deselectedItemIndex = selectedItems.firstIndex(where: { $0.id == products[indexPath.item].id}) {
            let price = selectedItems[deselectedItemIndex].price
                if let currentTotalPrice = Int(totalPrice) {
                    totalPrice = "\(currentTotalPrice - Int(truncating: price as NSNumber))"
                }
            
            selectedItems.remove(at: deselectedItemIndex)
        }
        updateItemsCount()
    }
}
    


