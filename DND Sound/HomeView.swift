//
//  HomeView.swift
//  DND Sound
//
//  Created by Caelin Jackson-King on 2019-01-01.
//  Copyright © 2019 Caelin Jackson-King. All rights reserved.
//

import UIKit
import CaelinCore

enum SoundButton {
    case metal
    case corridor
}

protocol HomeViewDelegate {
    /* Methods to pass actions back up to the controller for processing */
    func homeView(_: HomeView, didTap button: SoundButton)
}

class HomeView: UIView {
    let delegate: HomeViewDelegate
    let metal: UIButton = Standards.button(called: "Metal")
    let corridor: UIButton = Standards.button(called: "Corridor")
    let buttons: UIStackView
    
    init(delegate: HomeViewDelegate) {
        self.delegate = delegate
        buttons = Standards.stack(showing: [metal, corridor], along: .vertical)
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setup()
        metal.addAction(for: .touchUpInside) { [weak self] in
            guard let `self` = self else { return }
            self.delegate.homeView(self, didTap: .metal)
        }
        corridor.addAction(for: .touchUpInside) { [weak self] in
            guard let `self` = self else { return }
            self.delegate.homeView(self, didTap: .corridor)
        }
    }
    
    func setup() {
        addSubview(buttons)
        addConstraints([
            buttons.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            buttons.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttons.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
    
    // MARK: Annoying Boilerplate
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
