//
//  HouseViewController.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 10/6/20.
//

import Foundation
import UIKit

class HouseViewController: UIViewController {
    
    @IBOutlet weak var keyImage: UIImageView!
    @IBOutlet weak var talkingLabel: UILabel!
    @IBOutlet weak var randomClick: UIButton!
    @IBOutlet weak var collectKeyButtonClick: UIButton!
    @IBOutlet weak var inventorySlotOne: UIImageView!
    
    @IBOutlet weak var inventoryLabel: UILabel!
    var incorrectClickMessage = 0
    @IBOutlet weak var proceedToHouseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateLabel(text: "Ah, the house. Nothing scary about that! We can keep walking if you like. Place looks locked anyway.. Oh.. you want to get inside?")
        bringButtonToFront()
        inventorySlotOne.isHidden = true
        inventoryLabel.isHidden = true
        proceedToHouseButton.isHidden = true
    }
    
    func displayMessage() {
        switch incorrectClickMessage {
        case 0:
            animateLabel(text: "Hmm, can't proceed just yet")
            incorrectClickMessage = 1
        case 1:
            animateLabel(text: "What is that shiny thing?")
            incorrectClickMessage = 2
        case 2:
            animateLabel(text: "House might be locked")
            incorrectClickMessage = 3
        case 3:
            animateLabel(text: "I wonder if someone is inside")
            incorrectClickMessage = 4
        case 4:
            animateLabel(text: "House seems empty, just need to find a way in")
            incorrectClickMessage = 5
        case 5:
            animateLabel(text: "I hope it is cooler inside than out here")
            incorrectClickMessage = 6
        case 6:
            animateLabel(text: "I wonder if there are any keys for the lock")
            incorrectClickMessage = 0
        default:
            animateLabel(text: "hmm...")
    }
    
    
    }
    
    func bringButtonToFront() {
       // self.view.bringSubviewToFront(self.randomClick)
        self.view.bringSubviewToFront(self.collectKeyButtonClick)
        collectKeyButtonClick.layer.zPosition = 3
        
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
    
    
    @IBAction func randomClick(_ sender: UIButton) {
        displayMessage()
    }
    
    @IBAction func collectKeyButtonClick(_ sender: UIButton) {
        keyImage.isHidden = true
        collectKeyButtonClick.isHidden = true
        randomClick.isHidden = true
        animateLabel(text: "Ah, the key! Nice find! Let's see if it opens that door! Also, don't make the same mistake I did. Turn the key TO THE LEFT. Thanks!")
        inventorySlotOne.isHidden = false
        inventoryLabel.isHidden = false
        inventorySlotOne = UIImageView(image: #imageLiteral(resourceName: "smallkey"))
        proceedToHouseButton.isHidden = false
        self.view.bringSubviewToFront(self.proceedToHouseButton)
        
    }
    
    @IBAction func proceedToHouseButton(_ sender: UIButton) {
        performSegue(withIdentifier: "moveTowardsHouseSegue", sender: self)
    }
    
    
}
