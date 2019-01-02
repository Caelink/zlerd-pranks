//
//  HomeViewController.swift
//  DND Sound
//
//  Created by Caelin Jackson-King on 2019-01-01.
//  Copyright © 2019 Caelin Jackson-King. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
    var myView: HomeView?
    var player: AVAudioPlayer?
    init() {
        // Boilerplate 'empty' initialize to save other boilerplate
        super.init(nibName: nil, bundle: nil)
        myView = HomeView(delegate: self)
    }
    
    // Least boilerplate without using initializer antipatterns
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = myView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func playSound(named sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

extension HomeViewController: HomeViewDelegate {
    func homeView(_: HomeView, didTap button: SoundButton) {
        let sound: String
        switch button {
        case .corridor:
            sound = ["left", "left2", "right", "right2"].randomElement() ?? "left"
        case .metal:
            sound = ["moan", "moan2", "moan3"].randomElement() ?? "moan"
        }
        playSound(named: sound)
    }
}
