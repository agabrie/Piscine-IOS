//
//  ViewController.swift
//  ex01
//
//  Created by abduraghmaan GABRIELS on 2019/10/07.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblGreeting: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickButton(_ sender: Any) {
        lblGreeting.text = "Hello World !"
    }
    
}

