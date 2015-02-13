//
//  InterfaceController.swift
//  Guessing Game WatchKit Extension
//
//  Created by Alex Hudson on 2/13/15.
//  Copyright (c) 2015 Alex Hudson. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var theButton: WKInterfaceButton!


    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        self.theButton.setBackgroundColor(UIColor.greenColor())
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func onPlayButtonPressed() {

    }
}
