//
//  OnboardingView.swift
//  TestApp
//
//  Created by Bema on 24/5/24.
//

import Foundation
import UIKit

class OnboardingView: UIView {
    
    
    let imagesName = ["img", "img-2", "img-3"]
    // MARK: - Outlets
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPageIndicatorTintColor = .systemBlue
        
        return pageControl
    }()
    
    private let containerView = UIView()
    
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarchy()
        setupImageViews()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SettingImages
    
    private func setupImageViews() {
        for (index, imageName) in imagesName.enumerated() {
            let imageView = UIImageView(image: UIImage(named: imageName))
            imageView.frame = CGRect(x: CGFloat(index) * containerView.frame.width, y: 0, width: containerView.frame.width, height: containerView.frame.height)
            imageView.contentMode = .scaleAspectFit
            containerView.addSubview(imageView)
        }
    }
    
    // MARK: - Setups
    
    private func setupView() {
        
    }
    
    private func setupHierarchy() {
        self.addSubview(containerView)
        containerView.addSubview(pageControl)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    
}
