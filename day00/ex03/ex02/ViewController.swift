//
//  ViewController.swift
//  ex02
//
//  Created by abduraghmaan GABRIELS on 2019/10/07.
//  Copyright © 2019 abduraghmaan GABRIELS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var val1:Int? = 0
    var val2:Int? = 0
    var index:Int? = 1
    var operation:String = ""
    var newval:Bool = false
    @IBOutlet var lblOutput: UILabel!
    
    @IBAction func btnClicked(_ sender: UIButton) {
        if(newval)
        {
            clearLabel();
            newval = false
        }
        lblOutput.text = lblOutput.text! + sender.currentTitle!
        
    }
    @IBAction func printBtn(_ sender: UIButton) {
        print("\(sender.currentTitle!) Clicked")
    }
    @IBAction func btnAC(_ sender: UIButton) {
        clearLabel()
        val1 = 0
        val2 = 0
        index = 1
        operation = ""
        newval = false
    }
    @IBAction func btnNeg(_ sender: UIButton) {
        setVal1()
        if(val1 != 0){
            val1 = -1 &* Int(val1!)
            updatelbl(value: val1!)
        }
    }
    @IBAction func operation(_ sender: UIButton) {
        if(index == 1){
            setVal1()
        }else if(index == 2){
            setVal2()
        }
//        clearLabel()
        newval = true
        if(operation == ""){
            operation = sender.currentTitle!
            index = 2
        }else{
            calc();
            operation = sender.currentTitle!
            
        }
    }
    @IBAction func btnEqu(_ sender: UIButton) {
        if(index == 2){
            setVal2()
        }
        calc()
    }
    
//    These are csutom functions used by buttons
    func clearLabel(){
        lblOutput.text = ""
    }
    func updatelbl(value:Int){
        lblOutput.text = "\(value)"
    }
    func setVal1(){
        if(lblOutput.text! == "")
        {
            val1 = 0
        }else{
            val1 = Int(lblOutput.text!)
        }
    }
    func setVal2(){
        if(lblOutput.text! == "")
        {
            val2 = 0
        }else{
            val2 = Int(lblOutput.text!)
        }
    }
    func calc(){
        switch(operation){
            case "+":
                val1 = val1! &+ val2!
                break
            case "-":
                val1 = val1! &- val2!
                break
            case "x":
                val1 = val1! &* val2!
                break
            case "/":
                if(val2 != 0){
                    val1 = val1! / val2!
                }
                else{
                    val1 = 0
                }
                break
            default:
                break;
        }
        operation = ""
        updatelbl(value: val1!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

