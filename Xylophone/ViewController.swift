//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        guard let currentTitle = sender.currentTitle else { return }
        sender.layer.opacity = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.layer.opacity = 1
        }
        playSound(for: currentTitle)
    }
    
    func playSound(for key: String) {
        guard let url = Bundle.main.url(forResource: key, withExtension: "wav") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }

}

