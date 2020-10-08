//
//  HouseFrontDoorVc.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 10/7/20.
//

import UIKit

class HouseFrontDoorVc: UIViewController {
    

    @IBOutlet weak var restartGameButton: UIButton!
    @IBOutlet weak var talkingLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        let emitter = Emitter()
        
        super.viewDidLoad()
    
        
        emitter.particleEmitter(view: view, fileName: "FrontDoorSmoke", xval: 0, yval: 0)
        
        animateLabel(text: "This door always bothered me. Weird particles everywhere. Anyway, I guess it's time to go inside. Just make sure you turn the key to the left.")
        
        bringButtonToFront()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainMenuSegue" {
            let mainMenuVc = segue.destination as! FifthViewController
            mainMenuVc.displayTalkingText = 1
        }
    }
    
    func animateLabel(text: String) {
        
        talkingLabel.text = ""
            let titleText = text
            var charIndex = 0.0
            for letter in titleText {
                Timer.scheduledTimer(withTimeInterval: 0.04 * charIndex, repeats: false) { (timer) in
                    self.talkingLabel.text?.append(letter)
                }
                 charIndex += 1
        
            }
        //talkingLabel.layer.zPosition = 1
    }
    @IBAction func restartGameButton(_ sender: UIButton) {
        performSegue(withIdentifier: "mainMenuSegue", sender: self)
    }
    
    func bringButtonToFront() {
        self.view.bringSubviewToFront(self.restartGameButton)
    }
}
