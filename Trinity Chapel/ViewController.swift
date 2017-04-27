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
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "https://trinitychapel.churchg.com/mobile")
        let request = NSURLRequest(url: url! as URL)
        webView.loadRequest(request as URLRequest)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

