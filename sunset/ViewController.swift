//
//  ViewController.swift
//  sunset
//
//  Created by Bob on 09/10/2014.
//  Copyright (c) 2014 BallisticSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sunrise: UILabel!
    @IBOutlet var sunset: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        var url = "http://www.timeanddate.com/astronomy/uk/london"
        var urlString = NSURL(string: url)
// insert the url inside NSURL(string: "")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(urlString) {(data, response, error) in
        
            var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
            var contentArraySunrise = urlContent.componentsSeparatedByString("Sunrise Today: </span><span class=three>")
            var newContentArraySunrise = contentArraySunrise[1].componentsSeparatedByString("</span>")
            println(newContentArraySunrise[0])
            dispatch_async(dispatch_get_main_queue()){
            self.sunrise.text = newContentArraySunrise[0] as? String
            }
            
            var contentArraySunset = urlContent.componentsSeparatedByString("Sunset Today: </span><span class=three>")
            var newContentArraySunset = contentArraySunset[1].componentsSeparatedByString("</span>")
            println(newContentArraySunset[0])
            dispatch_async(dispatch_get_main_queue()){
            self.sunset.text = newContentArraySunset[0] as? String
            }
            }
        task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

