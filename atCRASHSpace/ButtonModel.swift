//
//  ButtonModel.swift
//  atCRASHSpace
//
//  Created by Carlyn Maw on 12/1/16.
//  Copyright © 2016 carlynorama. No rights reserved.
//

import Foundation


class ButtonPress:NSObject {
    //let pubdate: NSDate
    let pubdate: String
    let message: String
    let infolump: String
    let link: String
    //let link: NSURL
    
    var expired: Bool? = nil
    var ID: String? = nil
    var mins: String? = nil
    var minsDouble: Double? = nil
    var type: String? = nil
    
   // override init(){}
    init(pubdate:String, message:String, infolump:String, link:String){
        
        
        //var dateFormatter = DateFormatter()
        // this is imporant - we set our input date format to match our input string
        
        //var dateFromString = dateFormatter.date(from: pubstring)
        
        
        self.pubdate = pubdate
        self.message = message
        self.infolump = infolump
        self.link = link
    }
    
}

class ButtonPressHistory:NSObject, XMLParserDelegate {
    
    var data:[ButtonPress] = []
    //var XMLparser = XMLParser()
    //var elements = NSMutableDictionary()
    //var element = NSString()
    //var completionHandler = NSMutableArray()
    //var dataArray = NSMutableArray()
    
    
    
    
    
    
    
    
    func addRow(row:ButtonPress) {
        data += [row]
    }
    
//    func loadRemoteXMLData(urlString:String) {
//        guard let myURL = NSURL(string:urlString) else {
//            print("URL not defined properly")
//            return
//        }
//        guard let parser = XMLParser(contentsOf: myURL as URL) else {
//            print("Cannot Read Data")
//            return
//        }
//        
//        print("URL found")
//        parser.delegate = self
//        parser.parse()
//
        
//        if !parser.parse(){
//            print("Data Errors Exist:")
//            let error = parser.parserError!
//            print("Error Description:\(error.localizedDescription)")
//            print("Error reason:\(error.localizedFailureReason)")
//            print("Line number: \(parser.lineNumber)")
//        }
        
    }
    
    
}
