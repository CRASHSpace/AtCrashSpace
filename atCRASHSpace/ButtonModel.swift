//
//  ButtonModel.swift
//  atCRASHSpace
//
//  Created by Carlyn Maw on 12/1/16.
//  Copyright © 2016 carlynorama. No rights reserved.
//

import Foundation

var bph = ButtonPressHistory()

struct ButtonPress {
    let id: String
    let msg: String
    let diff_mins: Int
    let date: Date?
    let date_epoch: String
    let type: String
}

extension ButtonPress {
    // 'json' is dictionary where key is string, value is any
    init?(json: [String: Any]) {
        guard let id = json["id"] as? String,
            let msg = json["msg"] as? String,
            let diff_mins = json["diff_mins_max"] as? Int,
            let dateString = json["date"] as? String,
            let date_epoch = json["date_epoch"] as? String,
            let type = json["type"] as? String
            else {
                return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy HH:mm:ss Z"
        formatter.timeZone = NSTimeZone(name: "PST") as TimeZone!
        guard let dateAsDate = formatter.date(from: dateString) else {
            print("Not the expected date format")
            return nil
        }
        
        self.id = id
        self.msg = msg
        self.diff_mins = diff_mins
        self.date = dateAsDate
        self.date_epoch = date_epoch
        self.type = type
    }
}



class ButtonPressHistory:NSObject, XMLParserDelegate {
    
    var data:[ButtonPress] = []
    var isOpen: Bool = false
    var minutesLeft: Int = 0
    
    func addRow(row:ButtonPress) {
        data += [row]
    }
    
    
    
    func loadTestJSONData() {
        let file = "dummy_data" //this is the file. we will write to and read from it
        
        let jsonFile = Bundle.main.url(forResource: file, withExtension: "json")!
        //let urlString = "https://crashspacela.com/sign2/json/"
        //let url = URL(string: urlString)
        
        print("getting \(jsonFile)")
        
        let task = URLSession.shared.dataTask(with:jsonFile) { (data, response, error) in
            if error != nil {
                print("oh no \(error)")
            } else {
                print("hi there; we got data")
                do {
                    
                    let fullData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]

                    guard let tempStatus = fullData["is_open"] as! Bool? else {
                            print("No status datas")
                            return
                    }
                    
                    guard let tempMinLeft = fullData["minutes_left"] as! Double? else {
                        print("No time data")
                        return
                    }
                    
                    self.isOpen = tempStatus
                    print(tempMinLeft)
                    
                    print(self.isOpen)
                    
//                    
//                    
//                    if case let self.minutesLeft = fullData["minutes_left"] as? Double {
//                        print("minutesLeft value: \(minutesLeft)")
//                    }

                    
                    // convert json-ish data to struct, using extension
                    
                    if let buttonPressesData = fullData["button_presses"] as? [Any] {
                        print("parsing buttonPress array...")
                        
                        
                        for item in buttonPressesData {
                            let item = item as! [String:Any]
                            if let buttonPress = ButtonPress(json: item) {
                                self.addRow(row: buttonPress)
                            }
                        }
                    }

                    
                } catch { print("doh.")}
            }
        }
        task.resume()
    }
    
    
}
