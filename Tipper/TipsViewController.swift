//
//  TipsViewController.swift
//  Tipper
//
//  Created by Nag Varun Chunduru on 8/24/14.
//  Copyright (c) 2014 cnv. All rights reserved.
//

import UIKit

class TipsViewController: UIViewController {
    @IBOutlet weak var tipsSegmentControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipField: UILabel!
    @IBOutlet weak var totalField: UILabel!
    
    @IBOutlet weak var splitByOne: UILabel!
    @IBOutlet weak var splitByTwo: UILabel!
    @IBOutlet weak var splitByThree: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var itSuckedString = String(Int(floor(tipsControl.itSucked * 100))) + "%"
        tipsSegmentControl.setTitle(itSuckedString, forSegmentAtIndex: 0)
        
        var itWasOkString = String(Int(floor(tipsControl.itWasOk * 100))) + "%"
        tipsSegmentControl.setTitle(itWasOkString, forSegmentAtIndex: 1)
        
        var itWasAmazingString = String(Int(floor(tipsControl.itWasAmazing * 100))) + "%"
        tipsSegmentControl.setTitle(itWasAmazingString, forSegmentAtIndex: 2)
        
        billField.becomeFirstResponder()
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [tipsControl.itSucked, tipsControl.itWasOk, tipsControl.itWasAmazing]
        var tipPercentage = tipPercentages[tipsSegmentControl.selectedSegmentIndex]
        var billAmount = NSString(string: billField.text).doubleValue

        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        
        tipField.text = String(format: "$%.2f", tip)
        totalField.text = String(format: "$%.2f", total)
        splitByOne.text = String(format: "$%.2f", total)
        splitByTwo.text = String(format: "$%.2f", total/2)
        splitByThree.text = String(format: "$%.2f", total/3)
    }
    @IBAction func onEditingBegin(sender: AnyObject) {
    }
    @IBAction func onEditingDidEnd(sender: AnyObject) {
    }
    @IBAction func onValueChanged(sender: AnyObject) {
        var billAmount = NSString(string: billField.text.stringByTrimmingCharactersInSet(NSCharacterSet.symbolCharacterSet())).doubleValue
        billField.text = String(format: "$%.2f", billAmount)
    }
}
