//
//  GFUserInfoViewController.swift
//  GithubFollowers
//
//  Created by Abdul Dayur on 7/27/21.
//

import UIKit

class GFUserInfoViewController: UIViewController {
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let tittle = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        layoutUI()
        
    }
    
    func addSubViews() {
        let subviewArr = [avatarImageView, tittle, nameLabel, locationLabel, locationImageView, bioLabel]
        
        for subV in subviewArr {
            view.addSubview(subV)
        }
    }
    
    func layoutUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            
            tittle.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 5),
            
        ])
    }

}
