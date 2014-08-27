//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Nag Varun Chunduru on 8/24/14.
//  Copyright (c) 2014 cnv. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var itSucked: UITextField!
    @IBOutlet weak var itWasOk: UITextField!
    @IBOutlet weak var itWasAmazing: UITextField!
    @IBAction func updateItSucked(sender: AnyObject) {
        tipsControl.itSucked = NSString(string: itSucked.text).doubleValue / 100
    }
    @IBAction func updateItWasOk(sender: AnyObject) {
        tipsControl.itWasOk = NSString(string: itWasOk.text).doubleValue / 100
    }
    @IBAction func updateItWasAmazing(sender: AnyObject) {
        tipsControl.itWasAmazing = NSString(string: itWasAmazing.text).doubleValue / 100
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        itSucked.text = String(Int(floor(tipsControl.itSucked * 100)))
        itWasOk.text = String(Int(floor(tipsControl.itWasOk * 100)))
        itWasAmazing.text = String(Int(floor(tipsControl.itWasAmazing * 100)))
    }
}
