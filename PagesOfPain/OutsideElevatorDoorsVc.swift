//
//  OutsideElevatorDoorsVc.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 10/4/20.
//

import Foundation
import UIKit

class OutsideElevatorDoorsVc: UIViewController {
    
    let emitter = Emitter()
    @IBOutlet weak var talkingLabel: UILabel!
    @IBOutlet weak var goToNextPageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateLabel()
        
        emitter.particleEmitter(view: view, fileName: "RainParticle", xval: 500, yval: 900)
        
       bringButtonToFront()
        
    }
    
    func animateLabel() {
        
        talkingLabel.text = ""
            let titleText = "See what happens when you don't listen? This elevator should NOT lead outside. Well.. no going back now. P.S. DO NOT turn around. Ever. I didn't even create a button to let you turn around. Once you acknowledge it exists, then it can get close."
            var charIndex = 0.0
            for letter in titleText {
                Timer.scheduledTimer(withTimeInterval: 0.04 * charIndex, repeats: false) { (timer) in
                    self.talkingLabel.text?.append(letter)
                }
                 charIndex += 1
        
            }
        talkingLabel.layer.zPosition = 1
    }
    
    func bringButtonToFront() {
        self.view.bringSubviewToFront(self.goToNextPageButton)
       
    }
    
    
    @IBAction func goToNextPageButton(_ sender: UIButton) {
        performSegue(withIdentifier: "proceedIntoForestSegue", sender: self)
    }
    
}
