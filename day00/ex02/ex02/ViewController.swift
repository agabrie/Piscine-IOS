//
//  ViewController.swift
//  ex02
//
//  Created by abduraghmaan GABRIELS on 2019/10/07.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var val:Int? = 0
    @IBOutlet var lblOutput: UILabel!
    
    @IBAction func btnClicked(_ sender: UIButton) {
        lblOutput.text = lblOutput.text! + sender.currentTitle!
        val = Int(lblOutput.text!)
    }
    
    @IBAction func btnAC(_ sender: Any) {
        lblOutput.text = ""
    }
    
    @IBAction func btnEqu(_ sender: Any) {
        print("\(val!)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func printBtn(_ sender: UIButton) {
        print("\(sender.currentTitle!) Clicked")
    }
    
    
}

