//
//  UpdateViewController.swift
//  atCRASHSpace
//
//  Created by Carlyn Maw on 12/1/16.
//  Copyright © 2016 carlynorama. No rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {
    
    @IBOutlet var timeSetPicker: UIPickerView!
    
    @IBAction func addTimeButtonAction(_ sender: Any) {
        let timeLeft:String = String(timeToAdd.countDownDuration)
        
        print(timeLeft)
    }
    
    
    @IBOutlet var timeToAdd: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
