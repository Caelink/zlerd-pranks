//
//  Standards.swift
//  DND Sound
//
//  Created by Caelin Jackson-King on 2019-01-01.
//  Copyright © 2019 Caelin Jackson-King. All rights reserved.
//

import UIKit

enum ViewElement {
    enum Button {
        case primary
        case secondary
    }
    
}

class Standards {
    static func button(called text: String) -> UIButton {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.showsTouchWhenHighlighted = true
        button.setTitle(text, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }
    
    static func stackView(showing stack: [UIView], along axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = axis
        stack.alignment = .center
        stack.spacing = 20
        return stack
    }
}
