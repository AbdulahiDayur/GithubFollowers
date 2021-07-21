//
//  UIHelper.swift
//  GithubFollowers
//
//  Created by Abdul Dayur on 7/21/21.
//

import UIKit

struct UIHelper {
    
    static func createThreeColumnFlowLayOut(in view: UIView) -> UICollectionViewFlowLayout {
        
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availablewidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availablewidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
