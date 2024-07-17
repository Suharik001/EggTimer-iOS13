//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    
    var timeLeft = 60
    
    var cookingTime:Float = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var barProgress: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        barProgress.progress = 0
        
        timer.invalidate()

        
        
        let hardness = sender.currentTitle!
        
        titleLabel.text = hardness
        
        cookingTime = 1.0 / Float(eggTime[hardness]!)
        
        timeLeft = eggTime[hardness]!
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
    }
    
    @objc func onTimerFires() {
        if timeLeft > 0{
            print("\(timeLeft) seconds.")
            timeLeft -= 1
            barProgress.progress += Float(cookingTime)
        }else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            playsound()
        }
    }
    func playsound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
