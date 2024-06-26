//
//  ViewController.swift
//  TestApp
//
//  Created by Bema on 24/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    private let loadingView = LoadingView()

    // MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        loadData()
    }
    
    func loadData() {
        loadingView.show(on: self.view)
        
        DispatchQueue.global().async {
            sleep(5)
            DispatchQueue.main.async {
                self.loadingView.hide()
                self.showNext()
            }
        }
    }
    
    // MARK: - Setups

    private func setupView() {
        let onboardingView = OnboardingView(frame: self.view.bounds)
        view.addSubview(onboardingView)
        
    }
    
    private func showNext() {
        let nextViewController = LoginViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

}

