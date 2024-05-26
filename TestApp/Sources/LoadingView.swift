//
//  LoadingView.swift
//  TestApp
//
//  Created by Bema on 24/5/24.
//

import Foundation
import UIKit
import SnapKit

class LoadingView: UIView {
    
    var completionHandler: (() -> Void)?
    
    // MARK: - Outlets
    
    private let acitivityIndicator = UIActivityIndicatorView(style: .large)
    private let loadingIcon = UIImageView()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = .gray
        progressView.progressTintColor = .systemBlue
        return progressView
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        
    }
    
    // MARK: - Setups
    
    private func setupView() {
        let customColor = UIColor(hex: "#020C1E")
        self.backgroundColor = customColor
        self.layer.cornerRadius = 10
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        loadingIcon.translatesAutoresizingMaskIntoConstraints = false
        
        loadingIcon.image = UIImage(named: "logo")
    }
    
    private func setupHierarchy() {
        self.addSubview(progressView)
        self.addSubview(loadingIcon)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            progressView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            progressView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -170), // Прижимаем к нижнему краю, учитывая safe area
            progressView.heightAnchor.constraint(equalToConstant: 3),
            progressView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5)
        ])
        
        // Установка ограничений для loadingIcon
        NSLayoutConstraint.activate([
            loadingIcon.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 170),
            loadingIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        progressView.setProgress(0, animated: false)
        
        
        for i in 0..<100 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.03, execute: {
                self.progressView.setProgress(Float(i) / 100, animated: true)
            })
        }
    }
    
    func show(on view: UIView) {
        self.frame = view.bounds
        view.addSubview(self)
    }
    
    func hide() {
        self.removeFromSuperview()
        completionHandler?()
    }
    
}

public extension UIColor {
    convenience init(hex: String) {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.currentIndex = hexString.index(after: hexString.startIndex)
        }
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(color & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
