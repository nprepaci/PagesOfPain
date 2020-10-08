//
//  FlickerLights.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 10/3/20.
//

import Foundation
import UIKit

class FlickerLights {
    
    let tenthVc = TenthViewController()
    
    var flashCount = 0
    var flashingVariable = 0
    var flashLabel: UIColor = UIColor(white: 255/255, alpha: 0.2)
    
    func labelFlash() {
        while tenthVc.flashingVariable == 0 {
       
            if tenthVc.flashCount == 0 {
                tenthVc.flashingLabel.backgroundColor = UIColor(white: 255/255, alpha: 0.2)
                tenthVc.flashCount = 1
            } else if tenthVc.flashCount == 1 {
                tenthVc.flashingLabel.backgroundColor = UIColor(white: 255/255, alpha: 0.8)
                tenthVc.flashCount = 0
                }
             
                 
            }
    }
}
