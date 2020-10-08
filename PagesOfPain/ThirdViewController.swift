//
//  ThirdViewController.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 9/27/20.
//

import Foundation
import UIKit


class ThirdViewController: UIViewController {
    
    @IBOutlet weak var pageThreeTextField: UITextField!
    @IBOutlet weak var goToPageFourButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "pageFourSegue") {
            let fourthVC = segue.destination as! FourthViewController
            fourthVC.textFromThirdVC = pageThreeTextField.text
        }
    }
    
    
    @IBAction func goToPageFourButton(_ sender: UIButton) {
        if (pageThreeTextField.text != "") {
            performSegue(withIdentifier: "pageFourSegue", sender: self)
        }
    }
    
}
