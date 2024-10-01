//
//  ViewContCheckin.swift
//  Trackers
//
//  Created by Jose David Bustos H on 28-03-18.
//  Copyright © 2018 Sheldon. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

@available(iOS 13.0, *)
class ViewContCheckin: UIViewController {
    
 
      var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="Check";
           print("ViewContCheckin : YES")
        
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        
       // activityIndicator.startAnimating()
        //UIApplication.shared.beginIgnoringInteractionEvents()
        
        let delay = max(0.0, 6.0)
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            
            
            
            let storboard2 = UIStoryboard(name: "Main", bundle: nil)
            let secondVC2 = storboard2.instantiateViewController(withIdentifier: "ViewControlMenu") as! ViewControlMenu
            self.navigationController?.pushViewController(secondVC2, animated: true)
            

        }
        
        
       /*
        dispatch_after(DispatchTime.now(dispatch_time_t(DISPATCH_TIME_NOW), (Int64)(3 * NSEC_PER_SEC)), dispatch_get_main_queue()){
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            
        };*/
        
                  }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
