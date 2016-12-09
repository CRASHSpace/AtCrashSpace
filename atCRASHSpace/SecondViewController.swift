//
//  SecondViewController.swift
//  atCRASHSpace
//
//  Created by Carlyn Maw on 12/1/16.
//  Copyright © 2016 carlynorama. No rights reserved.
//

import UIKit




class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var bph = ButtonPressHistory()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bph.data.count
        //return 5
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "HistoryCell")
        
        let row = indexPath.row
        
        let datetime = bph.data[row].pubdate
        //let datetime = NSDate()
        //let infolump = bph.data[row].infolump
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        //let stringDate: String = formatter.string(from: datetime as Date)

        
        cell.textLabel?.text = datetime
        //cell.detailTextLabel?.text = infolump
        
        return cell
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //test data
        //loadTestData()
        
        
        //bph.loadRemoteXMLData(urlString: "https://crashspacela.com/sign/feed/")
        bph.loadRemoteXMLData(urlString: "dummy_data.xml")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadTestData() {
        bph.addRow(row: ButtonPress(pubdate:"Thu, 01 Dec 2016 11:38:28 -0800", message:"thisisatest", infolump:"todtest - iphoneapp - 1mins.", link:"http://crashspacela.com/sign/"))
        bph.addRow(row: ButtonPress(pubdate:"Tue, 22 Nov 2016 18:05:38 -0800", message:"Someone at the space!", infolump:"Meeting Room - update - 60mins.", link:"http://crashspacela.com/sign/"))
        
    }
    


}

