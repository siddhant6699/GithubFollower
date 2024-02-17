//
//  SearchVC.swift
//  GithubFollower
//
//  Created by Siddhant Chouhan on 13/02/24.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let getFollowerButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureGetFollowersButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFolloweListVC() {
        guard isUsernameEntered else {
            print("No Username")
            return
        }
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
// UI configurations
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureGetFollowersButton() {
        view.addSubview(getFollowerButton)
        getFollowerButton.addTarget(self, action: #selector(pushFolloweListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            getFollowerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -50),
            getFollowerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getFollowerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            getFollowerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            getFollowerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFolloweListVC()
        return true
    }
}
