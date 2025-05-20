//
//  PulseAnimationVC.swift
//  Dont Animation Loading Animation
//
//  Created by Atik Hasan on 5/20/25.
//

import UIKit

class PulseAnimationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.async {
            PulseContainerView.startAnimating(vc: self)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        PulseContainerView.stopAnimating(vc: self)
    }
    
    
}
