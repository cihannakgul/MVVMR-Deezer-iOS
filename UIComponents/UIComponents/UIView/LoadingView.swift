//
//  LoadingView.swift
//  UIComponents
//
//  Created by cihan on 13.05.23.
//

import Foundation
import Lottie
import UIKit
import TinyConstraints

public class LoadingView: UIView {
    
    private var animationView = LottieAnimationView(name: "loadingSpinner")
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Layout
extension LoadingView {
    
    private func addSubViews() {
        addAnimationView()
    }
    
    private func addAnimationView() {
        addSubview(animationView)
        animationView.centerInSuperview()
    }
}

// MARK: - Configure
extension LoadingView {
    
    private func configureContents() {
        backgroundColor = .blue.withAlphaComponent(0.25) //blue
        configureAnimationView()
    }
    
    private func configureAnimationView() {
        animationView.contentMode = .scaleAspectFit
        animationView.size(.init(width: 150, height: 150))
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.75
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
    }
}

