//
//  LoginViewController.swift
//  TestApp
//
//  Created by Bema on 28/5/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - UI
    
    private let headerView = AuthHeaderView(title: "Create your profile!", subTitle: "Let's start with your name")
    
    private let usernameField = CustomTextField(fieldType: .name)
    private let nextButton = UIButton()
    private let fullName = UILabel()
    
    // MARK: - Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        self.setupUI()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Setup
    private func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(hex: "#1C2F4E").cgColor,
            UIColor(hex: "#09172E").cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        gradientLayer.cornerRadius = view.layer.cornerRadius
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupUI() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        nextButton.layer.cornerRadius = 10
        nextButton.backgroundColor = UIColor(hex: "#B00D22")
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
        fullName.textColor = UIColor(hex: "#B00D22")
        fullName.text = "Full name"
        fullName.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(nextButton)
        usernameField.addSubview(fullName)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        fullName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            fullName.centerXAnchor.constraint(equalTo: usernameField.leadingAnchor, constant: 63),
            fullName.topAnchor.constraint(equalTo: usernameField.topAnchor, constant: 2),
            fullName.widthAnchor.constraint(equalToConstant: 100),
            fullName.heightAnchor.constraint(equalToConstant: 20),
            
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 270),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.nextButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.nextButton.heightAnchor.constraint(equalToConstant: 50),
            self.nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
    }
    
    @objc private func nextButtonTapped() {
        let nextViewController = LoginViewControllerSecond()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

