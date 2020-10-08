//
//  SixthViewController.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 9/29/20.
//

import Foundation
import UIKit
import SpriteKit

class SixthViewController: UIViewController {

    let emitter = Emitter()
    
    @IBOutlet weak var congratsLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    //var particleImage:UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emitter.particleEmitter(view: view, fileName: "BokehParticle", xval: 170, yval: 428)
        
        animateLabel()
        bringButtonToFront()
         
    }
    func particleEmitter() {
        let sk: SKView = SKView()
        sk.frame = view.bounds
        sk.backgroundColor = .clear
        view.addSubview(sk)

        let scene: SKScene = SKScene(size: view.bounds.size)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .clear

        let en = SKEmitterNode(fileNamed: "BokehParticle.sks")
        en?.position = sk.center

        scene.addChild(en!)
        sk.presentScene(scene)
    }


    func animateLabel() {
        
        congratsLabel.text = ""
            let titleText = "Congrats, you beat the game! You can now close this app out. Please do not click the 'Continue' button below. The development team forgot to remove it. Thanks!"
            var charIndex = 0.0
            for letter in titleText {
                Timer.scheduledTimer(withTimeInterval: 0.03 * charIndex, repeats: false) { (timer) in
                    self.congratsLabel.text?.append(letter)
                }
                 charIndex += 1
        
            }
        congratsLabel.layer.zPosition = 1
    
    
    }
    
    @IBAction func continueButton(_ sender: Any) {
        performSegue(withIdentifier: "goToVC7Segue", sender: self)
 
    }
    
    func bringButtonToFront() {
        self.view.bringSubviewToFront(self.continueButton)
    }

}
