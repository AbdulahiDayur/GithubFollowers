//
//  UserInfoViewController.swift
//  GithubFollowers
//
//  Created by Abdul Dayur on 7/25/21.
//

import UIKit

class UserInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }

}
