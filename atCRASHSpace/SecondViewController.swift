//
//  SecondViewController.swift
//  atCRASHSpace
//
//  Created by Carlyn Maw on 12/1/16.
//  Copyright © 2016 carlynorama. No rights reserved.
//

import UIKit


class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var buttonPressHistoryTable: UITableView!
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bph.data.count
        //return 5
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "HistoryCell")
        
        let row = indexPath.row
        
        let datetime = bph.data[row].date_epoch
        let message = bph.data[row].msg
        let id = bph.data[row].id
        let min_added = bph.data[row].diff_mins

        
        cell.textLabel?.text = message //"Boo!"
        cell.detailTextLabel?.text = "\(id) added \(min_added) at \(datetime)" //"EEEk!"
        return cell
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
       
        print("History View Loaded")
        //self.buttonPressHistoryTable.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

