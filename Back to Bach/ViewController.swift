//
//  ViewController.swift
//  Back to Bach
//
//  Created by Seth Walton on 8/31/18.
//  Copyright © 2018 Seth Walton. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    @IBOutlet var scrubber: UISlider!
    var player = AVAudioPlayer()
    let audioPath = Bundle.main.path(forResource: "bach", ofType: "mp3")
    var timer = Timer()
    @objc func updateScrubber(){
        scrubber.value = Float(player.currentTime)
    }
    @IBAction func play(_ sender: Any) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    
    @IBAction func Stop(_ sender: Any) {
        player.pause()
        timer.invalidate()
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
           
        }catch {
            //process error
        }
    }
    
    @IBAction func volumeChanged(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    
    @IBOutlet var volumeSlider: UISlider!
    
    @IBAction func scrubberMoved(_ sender: Any) {
        player.currentTime = TimeInterval(scrubber.value)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            scrubber.maximumValue = Float(player.duration)
            
            
        }catch {
            //process error
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

