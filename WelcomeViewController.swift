//
//  WelcomeViewController.swift
//  Agro
//
//  Created by Likhit Garimella on 12/12/19.
//  Copyright © 2019 Likhit Garimella. All rights reserved.
//

import UIKit
import SwiftUI

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.backgroundColor = .clear
        button1.layer.cornerRadius = 20
        button1.layer.borderWidth = 2
        button1.layer.borderColor = UIColor.black.cgColor
        
        button2.backgroundColor = .clear
        button2.layer.cornerRadius = 20
        button2.layer.borderWidth = 2
        button2.layer.borderColor = UIColor.black.cgColor
        
    }
    
}
