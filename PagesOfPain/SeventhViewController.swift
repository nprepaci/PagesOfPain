//
//  SeventhViewController.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 10/1/20.
//

import Foundation
import UIKit

class SeventhViewController: UIViewController {
    
    let emitter = Emitter()
  
    @IBOutlet weak var goToNextVcButton: UIButton!
    
    @IBOutlet weak var backroomsImageView: UIImageView!
    
    @IBOutlet weak var backupButton: UIButton!
    @IBOutlet weak var talkingLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        animateLabel()
        
        //shakeImage()
        
        emitter.particleEmitterTiedToButton(view: view, fileName: "FirefliesParticle", location: goToNextVcButton, xCoordinateMod: +10, yCoordinateMod: +10)
        
        bringButtonToFront()
        
    }
    
    func animateLabel() {
        
        talkingLabel.text = ""
            let titleText = "Like I said, nothing to see here! Only unfinished work and ugly stuff. Look, no buttons to even click! Just close the app, thanks!"
            var charIndex = 0.0
            for letter in titleText {
                Timer.scheduledTimer(withTimeInterval: 0.03 * charIndex, repeats: false) { (timer) in
                    self.talkingLabel.text?.append(letter)
                }
                 charIndex += 1
        
            }
        talkingLabel.layer.zPosition = 1
    
    
    }
    
    func shakeImage() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 999999999999
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: backroomsImageView.center.x - 0.3, y: backroomsImageView.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: backroomsImageView.center.x + 0.3, y: backroomsImageView.center.y))

        backroomsImageView.layer.add(animation, forKey: "position")
    }
  
    
    @IBAction func goToNextVcButton(_ sender: UIButton) {
        performSegue(withIdentifier: "eighthVCSegue", sender: self)
    }
    
    
    func bringButtonToFront() {
        self.view.bringSubviewToFront(self.goToNextVcButton)
    }
    
}
