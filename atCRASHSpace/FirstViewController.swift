//
//  FirstViewController.swift
//  atCRASHSpace
//
//  Created by Carlyn Maw on 12/1/16.
//  Copyright © 2016 carlynorama. No rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var statusLabel: UILabel!
    
    @IBOutlet var minutesLeftLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bph.loadTestJSONData(UIUpdateFunc: refreshLabels)
        print("gonna change labels")
        //refreshLabels()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func refreshLabels() {
        print("I see you.")
        if bph.isLoaded {
            if bph.isOpen {
                statusLabel.text = "OPEN!"
                minutesLeftLabel.text = String(format: "and will be for %.0f minutes more.", bph.minutesLeft)
            } else {
                statusLabel.text = "CLOSED"
            }
        } else {
            statusLabel.text = "-----"
            minutesLeftLabel.text = "please wait while data loads"
        }
    }

    func refreshTest() {
        print("I see you.")
        print(bph.isOpen)
        statusLabel.text = "OPEN!"
    }

    
}


