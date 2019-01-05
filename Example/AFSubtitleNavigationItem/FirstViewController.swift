//
//  FirstViewController.swift
//  AFSubtitleNavigationItem
//
//  Created by Ahmed Fathi Sayed on 01/05/2019.
//  Copyright (c) 2019 Ahmed Fathi Sayed. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.isSubtitleEnabled = true
        navigationItem.titleLabel?.text = "First Title"
        navigationItem.subtitleLabel?.text = "Subtitle 1"
    }
    
}

