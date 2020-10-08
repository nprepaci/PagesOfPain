//
//  SecondViewController.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 9/24/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    var importedText: String?

    @IBOutlet weak var secondButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
  
    @IBAction func goToPageThree(_ sender: UIButton) {
        performSegue(withIdentifier: "pageThreeSegue", sender: self)
    }
    

}
