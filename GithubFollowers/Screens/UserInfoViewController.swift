//
//  UserInfoViewController.swift
//  GithubFollowers
//
//  Created by Abdul Dayur on 7/25/21.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    let headerView = UIView()
    let itemOne = UIView()
    let itemTwo = UIView()
    var itemViews: [UIView] = []
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        layoutUI()
        getUserInfo()
    }
    
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] (result) in
            guard let self = self else {return}
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childVC:GFUserInfoViewController(user: user), to: self.headerView)
                }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            
            }
        }
    }
    
    
    func layoutUI() {
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        itemViews = [headerView, itemOne, itemTwo]
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ])
        }
        
        itemOne.backgroundColor = .systemPink
        itemTwo.backgroundColor = .systemBlue
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            itemOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemTwo.topAnchor.constraint(equalTo: itemOne.bottomAnchor, constant: padding),
            itemTwo.heightAnchor.constraint(equalToConstant: itemHeight)
        ])
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}
