//
//  LoginViewControllerSecond.swift
//  TestApp
//
//  Created by Bema on 28/5/24.
//

import UIKit

class LoginViewControllerSecond: UIViewController {
    
    // MARK: - DatePicker
    
    let datePicker = UIDatePicker()
    
    // MARK: - UI
    
    private let headerView = AuthHeaderView(title: "Create your profile!", subTitle: "Let's start with your name")
    
    private let dateField = CustomTextField(fieldType: .dateOfBirth)
    private let nextButton = UIButton()
    private let dateOfBirth = UILabel()
    
    // MARK: - Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        self.setupUI()
        setupDatePicker()
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
        
        dateOfBirth.textColor = UIColor(hex: "#B00D22")
        dateOfBirth.text = "Date of birth"
        dateOfBirth.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        
        self.view.addSubview(headerView)
        self.view.addSubview(dateField)
        self.view.addSubview(nextButton)
        dateField.addSubview(dateOfBirth)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        dateField.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirth.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateOfBirth.centerXAnchor.constraint(equalTo: dateField.leadingAnchor, constant: 68),
            dateOfBirth.topAnchor.constraint(equalTo: dateField.topAnchor, constant: 2),
            dateOfBirth.widthAnchor.constraint(equalToConstant: 100),
            dateOfBirth.heightAnchor.constraint(equalToConstant: 20),
            
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 270),
            
            self.dateField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            self.dateField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.dateField.heightAnchor.constraint(equalToConstant: 55),
            self.dateField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.nextButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            self.nextButton.heightAnchor.constraint(equalToConstant: 50),
            self.nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
        // Create toolbar with "Done" button
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        // Assign datePicker and toolbar to inputView and inputAccessoryView of the dateField
        dateField.inputView = datePicker
        dateField.inputAccessoryView = toolbar
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateField.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func donePressed() {
        dateField.resignFirstResponder()
    }
    
    @objc private func nextButtonTapped() {
        let nextViewController = ViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
