//
//  ViewController.swift
//  Trinity Chapel
//
//  Created by Babajide Oke on 24/04/2017.
//  Copyright © 2017 ChurchGURU. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UIWebViewDelegate , SFSafariViewControllerDelegate{

    
    @IBOutlet  var webView: UIWebView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //let url = NSURL(string: "larry.oke")
            //let request = NSURLRequest(url: url! as URL)
            //self.webView.loadRequest(request as URLRequest)
        
       
        //think
        webView.delegate = self

        
        let image : UIImage = UIImage(named:"runner")!
        imageView.image = image
        self.view.addSubview(imageView)
        
        let url = NSURL(string: "https://faithchapel.churchg.com/mobi.htm")
       

        let request = NSURLRequest(url: url! as URL)
        
        
        let task = URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            // this is where the completion handler code goes
            if let error = error {
                print(error)
                
                let alertVC = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "Close", style: .default, handler: { (ACTION :UIAlertAction!)in
                    exit(0)
                }))
                self.present(alertVC, animated: true, completion: nil)
                
                
            }else{
                self.imageView.removeFromSuperview()
                self.imageView.image = nil
                
                
                self.webView.loadRequest(request as URLRequest)
            }
        }
        task.resume()
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if navigationType == UIWebViewNavigationType.linkClicked {
            UIApplication.shared.open(request.url!, options: [:], completionHandler: nil)
            //if let url = NSURL(string: "www.google.com"){
                //UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            //}
            return false
        }
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if navigationType == UIWebViewNavigationType.linkClicked {
            let vcc = SFSafariViewController(url: request.url!, entersReaderIfAvailable: true)
            vcc.delegate = self
            present(vcc, animated: true)
            return false
        }

        
        if request.url?.scheme == "trinitychapel" {
            let index = request.url?.absoluteString.index((request.url?.absoluteString.startIndex)!, offsetBy: 37)
            let paypalURL = request.url?.absoluteString.substring(from: index!)
            print( paypalURL!)
          
            if let url = URL(string: paypalURL!) {
                let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
                vc.delegate = self
                present(vc, animated: true)
            }

        }
        
        return true
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
    
}



