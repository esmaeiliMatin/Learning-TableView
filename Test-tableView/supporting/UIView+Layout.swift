//
//  UIView+Layout.swift
//  Test-ScrollView
//
//  Created by Matin on 2023-11-26.
//

import UIKit

extension UIView {
    
    enum side {
        case allSides
        case leadingAndTrailing
        case topAndBottom
        case leading
        case trailing
        case top
        case bottom
    }
    
    enum viewSide {
        
    }
    
    @discardableResult
    func alignAllEdgesWithSuperview(side: side, _ margin: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        guard let superview else { fatalError("Not allowed without setting superview first!!") }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [NSLayoutConstraint] = []
        
        switch side {
        case .allSides:
            constraints.append(leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: margin.left))
            constraints.append(trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: margin.right))
            constraints.append(topAnchor.constraint(equalTo: superview.topAnchor, constant: margin.top))
            constraints.append(bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: margin.bottom))
        case .leadingAndTrailing:
            constraints.append(leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: margin.left))
            constraints.append(trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: margin.right))
        case .topAndBottom:
            constraints.append(topAnchor.constraint(equalTo: superview.topAnchor, constant: margin.top))
            constraints.append(bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: margin.bottom))
        case .leading:
            constraints.append(leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: margin.left))
        case .trailing:
            constraints.append(trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: margin.right))
        case .top:
            constraints.append(topAnchor.constraint(equalTo: superview.topAnchor, constant: margin.top))
        case .bottom:
            constraints.append(bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: margin.bottom))
        }
        
        NSLayoutConstraint.activate(constraints)
        
        return constraints
    }
    
    @discardableResult
    func setSize(width: CGFloat? = nil, height: CGFloat? = nil) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [NSLayoutConstraint] = []
        
        if let width = width {
            constraints.append(widthAnchor.constraint(equalToConstant: width))
        }
        
        if let height = height {
            constraints.append(heightAnchor.constraint(equalToConstant: height))
        }
        
        NSLayoutConstraint.activate(constraints)
        
        return constraints
    }
    
    func setOneSideConstraints(subviewSide: NSLayoutXAxisAnchor, superviewSide: NSLayoutXAxisAnchor, constant: CGFloat) -> [NSLayoutConstraint] {
        guard let superview else { fatalError("Not allowed without setting superview first!!") }

        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [NSLayoutConstraint] = []
        
        constraints.append(subviewSide.constraint(equalTo: superview.leadingAnchor, constant: constant))
        
        NSLayoutConstraint.activate(constraints)
        
        return constraints
    }
    
    @discardableResult
    func setCenterAnchorToCenterOfSuperview(axis: NSLayoutConstraint.Axis) -> [NSLayoutConstraint] {
        guard let superview else { fatalError("Not allowed without setting superview first!!") }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints: [NSLayoutConstraint] = []
        
        switch axis {
        case .horizontal:
            constraints.append(centerXAnchor.constraint(equalTo: superview.centerXAnchor))
        case .vertical:
            constraints.append(centerYAnchor.constraint(equalTo: superview.centerYAnchor))
        default:
            fatalError("Unsupported axis: \(axis)")
        }
        
        NSLayoutConstraint.activate(constraints)
        
        return constraints
    }
}
