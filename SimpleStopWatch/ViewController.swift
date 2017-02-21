//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by Martin Nordström on 2017-02-20.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var timer: UILabel!
    
    // Declares the variables
    
    //Makes timer optional
    var timerr: Timer?
    
    //Keeps track of the start time
    var startTime: Date = Date()
    var isPlaying: Bool = false
    
    // Simple IBOutles
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    
    // The function that will start the timer
    @IBAction func startTimer(_ sender: Any) {
        if isPlaying {
            return
        }
        startBtn.isEnabled = false
        stopBtn.isEnabled = true
        startTime = Date()
        timerr = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    // The function that will stop the timer
    @IBAction func stopTimer(_ sender: Any) {
        startBtn.isEnabled = true
        stopBtn.isEnabled = false
        
        timerr?.invalidate()
        isPlaying = false
    }
    
    // The function that will reset the timer
    @IBAction func resetTimer(_ sender: Any) {
        startBtn.isEnabled = true
        stopBtn.isEnabled = false
        
        timerr?.invalidate()
        isPlaying = false
        timer.text = "0.0"
        
    }
    
    // The function that will update the timer for every millisec
    func UpdateTimer() {
        let newDate = NSDate()
        //let dateFormatter = DateFormatter()
        let timeDifference = newDate.timeIntervalSince(startTime)

        timer.text = String(format: "%.1f", timeDifference)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetTimer(self)
    }
}

