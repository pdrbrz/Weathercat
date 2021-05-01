//
//  UIView+Constraints.swift
//  WeatherCats
//
//  Created by Pedro Braz on 01/05/21.
//

import UIKit

extension UIView {
    func setupConstraints(
        top: NSLayoutYAxisAnchor?,
        paddingTop: CGFloat,
        bottom: NSLayoutYAxisAnchor?,
        paddingBottom: CGFloat,
        leading: NSLayoutXAxisAnchor?,
        paddingLeading: CGFloat,
        trailing: NSLayoutXAxisAnchor?,
        paddingTrailing: CGFloat
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
    }
    
    func centerYTo(_ constraint: NSLayoutYAxisAnchor) {
        centerYAnchor.constraint(equalTo: constraint).isActive = true
        return
    }
    
    func centerXTo(_ constraint: NSLayoutXAxisAnchor) {
        centerXAnchor.constraint(equalTo: constraint).isActive = true
        return
    }
    
    func width(constant: CGFloat) {
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func height(constant: CGFloat) {
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }

    func constraintsToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview!.topAnchor),
            bottomAnchor.constraint(equalTo: superview!.bottomAnchor),
            leadingAnchor.constraint(equalTo: superview!.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview!.trailingAnchor)
        ])
    }

    func bindFrameToSuperviewBoundsWithAutoResizingMask() {
        translatesAutoresizingMaskIntoConstraints = true
        frame = superview!.bounds
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
