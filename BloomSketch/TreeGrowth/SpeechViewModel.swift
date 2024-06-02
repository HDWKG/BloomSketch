//
//  SpeechViewModel.swift
//  BloomSketch
//
//  Created by MacBook Pro on 01/06/24.
//

import Foundation
import UIKit
import AVKit

class SpeechViewModel: UIViewController {
    // Create a speech synthesizer.
    var synthesizer = AVSpeechSynthesizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func speakWhenClicked(_ sender: Any) {
        // Create an utterance.
        let utterance = AVSpeechUtterance(string: "The quick brown fox jumped over the lazy dog.")
        
        // Configure the utterance.
        utterance.rate = 0.57
        utterance.pitchMultiplier = 0.8
        utterance.postUtteranceDelay = 0.2
        utterance.volume = 0.8
        
        // Retrieve the British English voice.
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        synthesizer.speak(utterance)
    }
    
}
