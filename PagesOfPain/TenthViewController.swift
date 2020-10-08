//
//  TenthViewController.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 10/2/20.
//

import Foundation
import UIKit

class TenthViewController: UIViewController {
    
    //let flickerClass = FlickerLights()
    let emitter = Emitter()
    
    //this label is to change colors for the flash 
    @IBOutlet weak var flashingLabel: UILabel!
    
    @IBOutlet weak var goThroughDoorsButton: UIButton!
    @IBOutlet weak var talkingLabel: UILabel!
    
    var flashingVariable = 0
    var flashCount = 0
    let queue = DispatchQueue(label: "Queue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //flickerClass.labelFlash()
        //labelFlash()
        
        emitter.particleEmitter(view: view, fileName: "ElevatorSmoke", xval: 0, yval: -10)
        
        goThroughDoorsButton.layer.zPosition = 1
        animateLabel()
        
        bringButtonToFront()
        
    
        
    }
    //cannot get it to flash because while loop needs to run on another threadother than the main thread
    func labelFlash() {
        queue.sync {
            
            while self.flashingVariable == 0 {
       
                if self.flashCount == 0 {
                    //label to change colors to simulate flashing
                    self.flashingLabel.backgroundColor = UIColor(white: 255/255, alpha: 0.2)
                    self.flashCount = 1
                } else if self.flashCount == 1 {
                    self.flashingLabel.backgroundColor = UIColor(white: 255/255, alpha: 0.8)
                    self.flashCount = 0
                }
              }
           }
        }
    
    func animateLabel() {
        
        talkingLabel.text = ""
            let titleText = "Cool, the bottom floor. Elevator seems a bit broken and smokey, no going back up. I know we made it this far.. but please wait inside the elevator and call for help. If you open those doors from the inside, there is no going back. The only safe way to exit the elvator is to have someone open the doors from the outside. Take it from me.. how do you think I got stuck writing these messages?"
            var charIndex = 0.0
            for letter in titleText {
                Timer.scheduledTimer(withTimeInterval: 0.04 * charIndex, repeats: false) { (timer) in
                    self.talkingLabel.text?.append(letter)
                }
                 charIndex += 1
        
            }
        talkingLabel.layer.zPosition = 1
    }
 
    @IBAction func goThoughDoorsButton(_ sender: Any) {
        
        performSegue(withIdentifier: "outsideElevatorSegue", sender: self)
    }
    
    func bringButtonToFront() {
        view.bringSubviewToFront(self.goThroughDoorsButton)
    }
    
    
}
