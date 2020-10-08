//
//  HomeMenu.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 9/29/20.
//

import Foundation
import UIKit
import SpriteKit


class HomeMenu: UIViewController {
    
    let emitter = Emitter()
    
    
    
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        //multiple emitters = multiple functions!
        //just need to alter positions
 
        //emitter.particleEmitter(view: view, fileName: "SparkParticle.sks", xval: 185, yval: 405)
        
        bringButtonToFront()
    }
    
    func bringButtonToFront() {
        self.view.bringSubviewToFront(self.playButton)
       
    }
    
    
    @IBAction func playButton(_ sender: Any) {
        performSegue(withIdentifier: "startGaneSegue", sender: self)
    }
    
    
}
