//
//  GFFollowerItemVC.swift
//  GithubFollowers
//
//  Created by Abdul Dayur on 8/4/21.
//

//Subclass of ItemInfoVC
import UIKit

class GFFollowerItemViewController: GFItemInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
