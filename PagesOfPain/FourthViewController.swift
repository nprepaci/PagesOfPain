//
//  FourthViewController.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 9/27/20.
//

import UIKit

class FourthViewController: UIViewController {
    
    var textFromThirdVC: String?
    
    @IBOutlet weak var vCFourLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vCFourLabel.text = textFromThirdVC
        
    
    }
    
    
    @IBAction func goToFifthViewButton(_ sender: UIButton) {
        performSegue(withIdentifier: "displayVcSixSegue", sender: self)
    }
}

