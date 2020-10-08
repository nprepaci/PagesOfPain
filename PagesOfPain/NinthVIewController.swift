//
//  NinthVIewController.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 10/2/20.
//

import UIKit

class NinthViewController: UIViewController {
    
    @IBOutlet weak var talkingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateLabel()
        
    }
    func animateLabel() {
        
        talkingLabel.text = ""
            let titleText = "Ignoring my advice per usual and entering the elevator. I wouldn't even try pressing the buttons. The thing is broken and won't move. Just close the app, nothing to see here."
            var charIndex = 0.0
            for letter in titleText {
                Timer.scheduledTimer(withTimeInterval: 0.04 * charIndex, repeats: false) { (timer) in
                    self.talkingLabel.text?.append(letter)
                }
                 charIndex += 1
        
            }
        talkingLabel.layer.zPosition = 1
    
    
    }
    @IBAction func elevatorButtonClick(_ sender: UIButton) {
        
        performSegue(withIdentifier: "tenthVcSegue", sender: self)
    }
}
