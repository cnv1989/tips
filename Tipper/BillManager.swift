//
//  BillManager.swift
//  Tipper
//
//  Created by Nag Varun Chunduru on 8/24/14.
//  Copyright (c) 2014 cnv. All rights reserved.
//

import UIKit

struct Bill {
    var bill = 0.00
    var tipPercentage = 0.00
    var date: NSDate!
    
    var total: Double {
        return (bill + bill * tipPercentage)
    }
    
    var tip: Double {
        return (bill * tipPercentage)
    }
    
    var dateString: String {
        var formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        return formatter.stringFromDate(date)
    }
    
}

class BillManager: NSObject {
    var bills = [Bill]()
    
    func addBill(bill: Bill) {
        bills.append(bill)
    }
}
