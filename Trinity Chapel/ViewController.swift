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
    //@IBOutlet weak var imageView: UIImageView!
    
    var activityIndicator = UIActivityIndicatorView()
    
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //let url = NSURL(string: "larry.oke")
            //let request = NSURLRequest(url: url! as URL)
            //self.webView.loadRequest(request as URLRequest)
        
       
        //think
        webView.delegate = self
        webView.frame = self.view.bounds
        
        
        webView.mediaPlaybackRequiresUserAction = false

        
        
        let image  = UIImage(named:"runner")!
        imageView = UIImageView(image:image)
        
        
        
        self.view.addSubview(imageView)
        
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        
        let midY = self.view.frame.height / 2
        let midX = self.view.frame.width / 2
        activityIndicator.frame = CGRect(x: midX, y: midY, width: 100, height: 100)
        let transform: CGAffineTransform = CGAffineTransform(scaleX: 2, y: 2)
        activityIndicator.transform = transform
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        
        let url = NSURL(string: "https://faithchapel.churchg.com/mobi.htm")
        //let url = NSURL(string: "https://www.google.com")


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
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                    self.webView.loadRequest(request as URLRequest)
                })
               
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
    
    func webViewDidFinishLoad(_ webView : UIWebView) {
        activityIndicator.removeFromSuperview()
        imageView.removeFromSuperview()
        imageView.image = nil
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



