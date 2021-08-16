//
//  FavoritesListViewController.swift
//  GithubFollowers
//
//  Created by Abdul Dayur on 7/10/21.
//

import UIKit

class FavoritesListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        PersistenceManager.retrieveFavorites { (result) in
            switch result {
            case .success(let favorites):
                for fav in favorites {
                    print(fav.login)
                }
                
                
            case .failure(let error):
                break
            }
        }
    }
}
