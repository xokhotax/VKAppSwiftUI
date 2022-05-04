//
//  VKLoginWebView.swift
//  VKAPPSwiftUI
//
//  Created by Ivan Okhota on 29.04.2022.
//

import SwiftUI
import WebKit

struct VKLoginWebView: UIViewRepresentable {
  
  fileprivate let navigationDelegate = WebViewNavigationDelegate()
  
  func makeUIView(context: Context) -> WKWebView {
    let webView = WKWebView()
    webView.navigationDelegate = navigationDelegate
    return webView
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    if let request = buildAuthRequest() {
      uiView.load(request)
    }
  }
  
  private func buildAuthRequest() -> URLRequest? {
    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "oauth.vk.com"
    urlComponents.path = "/authorize"
    urlComponents.queryItems = [
      URLQueryItem(name: "client_id", value: "8034847"),
      URLQueryItem(name: "scope", value: "wall,friends,groups"),
      URLQueryItem(name: "display", value: "mobile"),
      URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
      URLQueryItem(name: "response_type", value: "token"),
      URLQueryItem(name: "user_id", value: "userId"),
      URLQueryItem(name: "v", value: "5.131")
      
    ]
    let errorURL = URL(string: "https://oauth.vk.com/blank.html")!
    guard let url = urlComponents.url else { return URLRequest(url: errorURL)}
    let request = URLRequest(url: url)
    return request
  }
}

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
  
  func webView(_ webView: WKWebView,
               decidePolicyFor navigationResponse: WKNavigationResponse,
               decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
    
    guard let url = navigationResponse.response.url,
          url.path == "/blank.html",
          let fragment = url.fragment else {
      decisionHandler(.allow)
      return
    }
    
    let parameters = fragment
      .components(separatedBy: "&")
      .map { $0.components(separatedBy: "=") }
      .reduce([String: String]()) { result, param in
        var dict = result
        let key = param[0]
        let value = param[1]
        dict[key] = value
        return dict
      }
    
    guard let token = parameters["access_token"],
          let userId = parameters ["user_id"] else { return }
    
    let session = Session.shared
    session.token = token
    session.userId = userId
    
    UserDefaults.standard.set(token, forKey: "vkToken")
    UserDefaults.standard.set(userId, forKey: "userId")
    NotificationCenter.default.post(name: NSNotification.Name("vkTokenSaved"), object: self)
    NotificationCenter.default.post(name: NSNotification.Name("userIdSaved"), object: self)
    
    decisionHandler(.cancel)
  }
}
