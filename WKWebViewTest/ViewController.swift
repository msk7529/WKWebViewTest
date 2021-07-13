//
//  ViewController.swift
//  WKWebViewTest
//
//  Created by kakao on 2021/07/13.
//

import UIKit
import WebKit

final class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.request(url: "http://www.naver.com")
    }
    
    private func request(url: String) {
        self.webView.load(URLRequest(url: URL(string: url)!))
        self.webView.navigationDelegate = self
    }

    @IBAction func goBack(_ sender: Any) {
        if self.webView.canGoBack {
            self.webView.goBack()
        }
    }
    
    @IBAction func goForward(_ sender: Any) {
        if self.webView.canGoForward {
            self.webView.goForward()
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.request(url: searchBar.text!)
        
        self.view.endEditing(true)  // 다른 곳을 터치하면 키보드가 내려갈 수 있도록.
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.searchBar.text = webView.url?.absoluteString
    }
}
