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
        
        print(dateString)
        //Sun, 20 Nov 2016 14:35:00 -0800
        let formatter = DateFormatter()
        formatter.dateFormat = "E, dd MMM yyyy HH:mm:ss Z"
        formatter.timeZone = NSTimeZone(name: "PST") as TimeZone!
        //let dateAsDate = formatter.date(from: dateString)
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
    
    func addRow(row:ButtonPress) {
        data += [row]
    }
    
    
//    func loadRemoteJSONData(urlString:String) {
//        guard let myURL = NSURL(string:urlString) else {
//            print("URL not defined properly")
//            return
//        }
        
        
//        URLSession.shared.dataTask(with:myURL) { (data, response, error) in
//            if error != nil {
//                print("oh no \(error)")
//            } else {
//                print("hi there; we got server response")
//                do {
//                    
//                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [Any]
//                    
//                    print("all items:");
//                    print("-------------");
//                    
//                    for item in parsedData {
//                        let item = item as! [String:Any] // recast as array w/ key:string, val:any
//                        let id = item["id"] as! String
//                        let msg = item["msg"] as! String
//                        let diff_mins = item["diff_mins_max"] as! Int
//                        print("  item: id:\(id), msg:\(msg), diff_mins:\(diff_mins)")
//                    }
//                    
//                    // from https://developer.apple.com/swift/blog/?id=37
//                    // convert json-ish data to struct, using extension
//                    for item in parsedData {
//                        let item = item as! [String:Any]
//                        if let buttonPress = ButtonPress(json: item) {
//                            self.append(buttonPress)
//                        }
//                    }
//                    
//                    print("\nbuttonPress structs");
//                    print("-------------");
//                    
//                    for b in self {
//                        print("buttonPress: \(b.id) '\(b.msg)' for \(b.diff_mins) minutes at \(b.date)")
//                    }
//                    
//                } catch let error as NSError {
//                    print(error)
//                }
//            }
//            
//            }.resume()

//    }
    
    func loadTestJSONData() {
        let file = "dummy_data" //this is the file. we will write to and read from it
        
        let jsonFile = Bundle.main.url(forResource: file, withExtension: "json")!
        print("getting \(jsonFile)")
        
        let task = URLSession.shared.dataTask(with:jsonFile) { (data, response, error) in
            if error != nil {
                print("oh no \(error)")
            } else {
                print("hi there; we got data")
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [Any]
                    
                    print("all items:");
                    print("-------------");
                    print(parsedData)
                    
                    
//                    for item in parsedData {
//                        let item = item as! [String:Any] // recast as array w/ key:string, val:any
//                        let id = item["id"] as! String
//                        let msg = item["msg"] as! String
//                        let diff_mins = item["diff_mins_max"] as! Int
//                        print("  item: id:\(id), msg:\(msg), diff_mins:\(diff_mins)")
//                    }
                    
                    // from https://developer.apple.com/swift/blog/?id=37
                    // convert json-ish data to struct, using extension
                    for item in parsedData {
                        let item = item as! [String:Any]
                        if let buttonPress = ButtonPress(json: item) {
                            self.addRow(row: buttonPress)
                        }
                    }
                    
                    print("\nbuttonPress structs");
                    print("-------------");
                    
//                    for b in self {
//                        print("buttonPress: \(b.id) '\(b.msg)' for \(b.diff_mins) minutes at \(b.date)")
//                    }
                    

                    
                } catch { print("doh.")}
            }
        }
        task.resume()
    }

    
}
