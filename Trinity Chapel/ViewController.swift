//
//  ViewController.swift
//  Trinity Chapel
//
//  Created by Babajide Oke on 24/04/2017.
//  Copyright © 2017 ChurchGURU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet  var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //let url = NSURL(string: "https://faithchapel.churchg.com/mobi.htm")
            //let request = NSURLRequest(url: url! as URL)
            //self.webView.loadRequest(request as URLRequest)
        
        let url = NSURL(string: "https://faithchapel.churchg.com/mobi.htm")
        let request = NSURLRequest(url: url! as URL)
        let task = URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            // this is where the completion handler code goes
            if let error = error {
                print(error)
            }else{
                self.webView.loadRequest(request as URLRequest)
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

