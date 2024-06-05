//
//  CollectionViewExtensions.swift
//  Feed Screen
//
//  Created by Kibbcom on 25/04/24.
//

import UIKit

extension ProductViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = ((leftSpacing + rightSpacing) + (cellSpacing * CGFloat(itemsPerRow - 1)))
        let width = (collectionView.bounds.width - totalSpacing) / CGFloat(itemsPerRow)
        return CGSize(width: width, height: width * 1.4 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: topSpacing, left: leftSpacing, bottom: bottomSpacing, right: rightSpacing)
    }
}
