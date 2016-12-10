//
//  FirstViewController.swift
//  atCRASHSpace
//
//  Created by Carlyn Maw on 12/1/16.
//  Copyright © 2016 carlynorama. No rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bph.loadTestJSONData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


