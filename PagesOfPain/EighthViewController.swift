//
//  EighthViewController.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 10/1/20.
//

import UIKit
import SpriteKit

class EighthViewController: ViewController {
    
    
    @IBOutlet weak var enterElevatorButton: UIButton!
    @IBOutlet weak var talkingLabel: UILabel!
    
    let emitter = Emitter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateLabel()

        
        
        

    }
    func animateLabel() {
        
        talkingLabel.text = ""
            let titleText = "Ok you found the elevator. Pretty sure I saw an out of service sign on it. Doesn't make sense to use a broken elevator! Store is closing anyway, may as well go home."
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
        self.view.bringSubviewToFront(self.enterElevatorButton)
    }
    

    @IBAction func enterElevatorButton(_ sender: Any) {
        performSegue(withIdentifier: "enterElevatorSegue", sender: self)
        
        
    }
    

}
