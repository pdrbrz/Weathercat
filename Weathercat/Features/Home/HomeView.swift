//
//  HomeView.swift
//  Weathercat
//
//  Created by Pedro Braz on 26/04/21.
//

import UIKit

extension HomeView {
    private enum Metrics {
        static let labelSize: CGSize = .init(width: 150, height: 50)
    }
}

public final class HomeView: UIView {
    
    // Mark: - INIT
    override public init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    private lazy var testLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, Warudo!"
        label.backgroundColor = .brown
        return label
    }()
    
    // MARK: - Setup
    
    
    private func setup() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        buildViewHierarchy()
        setupConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(testLabel)
    }
    
    private func setupConstraints() {
        testLabel.width(constant: Metrics.labelSize.width)
        testLabel.height(constant: Metrics.labelSize.height)
        testLabel.centerYTo(centerYAnchor)
        testLabel.centerXTo(centerXAnchor)
    }
}
