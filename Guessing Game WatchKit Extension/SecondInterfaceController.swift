//
//  SecondInterfaceController.swift
//  Guessing Game
//
//  Created by Alex Hudson on 2/13/15.
//  Copyright (c) 2015 Alex Hudson. All rights reserved.
//

import WatchKit
import Foundation


class SecondInterfaceController: WKInterfaceController {

    @IBOutlet weak var hurryUpLabel: WKInterfaceLabel!
    @IBOutlet weak var theTimer: WKInterfaceTimer!
    @IBOutlet weak var clicksLeftLabel: WKInterfaceLabel!
    @IBOutlet weak var ulmButton: WKInterfaceButton!
    @IBOutlet weak var otherbutton1: WKInterfaceButton!
    @IBOutlet weak var otherbutton2: WKInterfaceButton!
    @IBOutlet weak var otherbutton3: WKInterfaceButton!



    var theCounter: NSInteger = 2
    var theDuration:NSTimeInterval = 15.00
    var doneTimer:NSTimer?

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        self.startOurTimer()
        
        var counterString:String = String(format: "Clicks left : %d", theCounter)

        clicksLeftLabel.setText(counterString)


    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func startOurTimer()
    {
        //Sets the timer in the interfacecController to 20 
        theTimer.setDate(NSDate(timeIntervalSinceNow: theDuration))
        theTimer.start()

        //Sets a count down timer and sets calls timerFired
        doneTimer = NSTimer.scheduledTimerWithTimeInterval(theDuration, target: self, selector: Selector("timerFired"), userInfo: nil, repeats: false)
    }

   func timerFired() {

        self.hurryUpLabel.setText("You were too slow!")
        self.hurryUpLabel.setTextColor(UIColor.redColor())
   }

    @IBAction func onUlmButtPressed() {

        theCounter -= 1

        var counterString:String = String(format: "Clicks left : %d", theCounter)

        clicksLeftLabel.setText(counterString)

        ulmButton.setBackgroundColor(UIColor.greenColor())

        hurryUpLabel.setText("You Won!")

        theTimer.stop()
        doneTimer?.invalidate()
    }

    @IBAction func onOtherButtonsPressed() {

        theCounter -= 1

        var counterString:String = String(format: "Clicks left : %d", theCounter)

        clicksLeftLabel.setText(counterString)

        if (theCounter == 0) {

            theTimer.stop()
            doneTimer?.invalidate()

            hurryUpLabel.setText("maybe next time")
            hurryUpLabel.setTextColor(UIColor.redColor())

            ulmButton.setEnabled(false)
            otherbutton1.setEnabled(false)
            otherbutton2.setEnabled(false)
            otherbutton3.setEnabled(false)
        }
    }

}