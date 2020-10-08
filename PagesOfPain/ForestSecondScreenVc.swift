//
//  FindTheKeyViewController.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 10/5/20.
//

import Foundation
import UIKit

class ForestSecondScreenVc: UIViewController {
    
    let emitter = Emitter()
    
    @IBOutlet weak var proceedButtonClick: UIButton!
    @IBOutlet weak var talkinLabel: UILabel!
    //to avoid polluting viewDidLoad do this
    //{} is referred to as a closure or an anonyomous function
    //parenthesis at the end call the closure, basically like a function
//    let keyImage: UIImageView = {
//        let keyImageView = UIImageView(image: #imageLiteral(resourceName: "key2"))
//        //this enables autolayout for our ketImage
//        keyImageView.translatesAutoresizingMaskIntoConstraints = false
//        return keyImageView
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateLabel()
        bringButtonToFront()
        
        //after image: typed image literal then double clicked and let me select the keys
       // view.addSubview(keyImage)
        
    
        //setupLayout()
        
        emitter.particleEmitter(view: view, fileName: "ForestFog", xval: 0, yval: 400)
        
        bringButtonToFront()
        
        
    }
    
    private func setupLayout() {
        //.isactive = true is actiavating the auto layout constraints specified in the translate above
        //keyImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //centered the image
        //keyImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //uses top anchor and then pads it by a number
//        keyImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 677).isActive = true
//        keyImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 150).isActive = true
//        
//        keyImage.widthAnchor.constraint(equalToConstant: 45).isActive = true
//        keyImage.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        
        
    }
    
    
    func animateLabel() {
        
        talkinLabel.text = ""
            let titleText = "Well you made it this far, may as well keep going. I think I can see the house from here. Can you spot it through the fog?"
            var charIndex = 0.0
            for letter in titleText {
                Timer.scheduledTimer(withTimeInterval: 0.04 * charIndex, repeats: false) { (timer) in
                    self.talkinLabel.text?.append(letter)
                }
                 charIndex += 1
        
            }
        talkinLabel.layer.zPosition = 1
    }
    
    
    func bringButtonToFront() {
        self.view.bringSubviewToFront(self.proceedButtonClick)
        
    }
    @IBAction func proceedButtonClick(_ sender: UIButton) {
        performSegue(withIdentifier: "nextPageSegue", sender: self)
    }
}
