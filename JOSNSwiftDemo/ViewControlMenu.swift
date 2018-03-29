//
//  ViewControlMenu.swift
//  Trackers
//
//  Created by Jose David Bustos H on 28-03-18.
//  Copyright © 2018 Sheldon. All rights reserved.
//

import Foundation
import UIKit

class ViewControlMenu: UIViewController {
    
    @IBOutlet weak var MenuView: UIView!
    @IBOutlet weak var LeadingContraint: NSLayoutConstraint!
    var menuSHowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuView.layer.shadowOpacity = 1
        MenuView.layer.shadowRadius = 6
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func MenuAction(_ sender: Any) {
        
        if (menuSHowing)
        {
            LeadingContraint.constant = -200
        }else{
            LeadingContraint.constant = 0
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
        }
        menuSHowing = !menuSHowing
    }
    
    
}

