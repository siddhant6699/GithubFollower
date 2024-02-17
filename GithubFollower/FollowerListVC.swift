//
//  FollowerListVC.swift
//  GithubFollower
//
//  Created by Siddhant Chouhan on 17/02/24.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
