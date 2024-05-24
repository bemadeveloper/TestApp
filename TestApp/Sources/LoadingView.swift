//
//  LoadingView.swift
//  TestApp
//
//  Created by Bema on 24/5/24.
//

import Foundation
import UIKit

class LoadingView: UIView {
    private let acitivityIndicator = UIActivityIndicatorView(style: .large)
    private let loadingLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = UIColor(white: 0, alpha: 0.7)
        self.layer.cornerRadius = 10
        
        acitivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        loadingLabel.text = "Loading..."
        loadingLabel.textColor = .white
        loadingLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        self.addSubview(acitivityIndicator)
        self.addSubview(loadingLabel)
        
        NSLayoutConstraint.activate([
            
        ])
        
    }
}
