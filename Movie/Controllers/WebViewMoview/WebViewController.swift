//
//  WebViewController.swift
//  Movie
//
//  Created by syawal zt on 12/03/25.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate, URLSessionDelegate{
    
var id = 0
var urlS = "https://www.themoviedb.org/movie/"
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var myProgressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Web View"
        myProgressBar.progress = 0.0
        myProgressBar.isHidden = false
        self.urlS += String(id)
        let url = URL(string: urlS)
        webView.load(URLRequest(url: url!))
        self.webView.reload()
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        self.webView.navigationDelegate = self
        // Do any additional setup after loading the view.
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        myProgressBar.progress = 0.0
        myProgressBar.isHidden = false
        myProgressBar.alpha = 1
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myProgressBar.isHidden = true
        myProgressBar.alpha = 0
        myProgressBar.progress = 0.0
        
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress"
        {
            /*print(self.webView.estimatedProgress)*/
            /*self.myProgressBar.progress = Float(self.webView.estimatedProgress)*/
            self.myProgressBar.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
