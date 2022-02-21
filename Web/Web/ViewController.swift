//
//  ViewController.swift
//  Web
//
//  Created by 서희찬 on 2022/02/21.
//
import WebKit
import UIKit

class ViewController: UIViewController, WKNavigationDelegate{

    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var txtUrl: UITextField!
    
    //지정 웹페이지 보여주는 함수
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url : myUrl!) // url을 request형으로 선언
        myWebView.load(myRequest) //
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //로딩중인지 살피기 위한 데릴게이트
        myWebView.navigationDelegate = self
        
        // 시작시 지정 웹페이지 나오게 하기
        loadWebPage("https://with910dgree.netlify.app/")
    }
    
    //로딩중을 위한 함수들
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating() //로딩중일때 나타나게 하기
        myActivityIndicator.isHidden = false
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func checkUrl(_ url: String)->String{
        var setUrl = url
        let flag = setUrl.hasPrefix("http://") // http를 가지고 있는지 확인후 true false 반환
        if !flag{
            setUrl = "http://" + setUrl //http있는걸로 변환
        }
        return setUrl
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!) // 텍스트적은값 전달
        txtUrl.text = "" // 갔으면 비우기
        loadWebPage(myUrl) // myUrl에 저장된 곳으로 고고
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("https://with910dgree.netlify.app/")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("https://with910dgree.netlify.app/")
    }
    
    //html읽기
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlStirng = "<h1>zzzZ</h1>"
        myWebView.loadHTMLString(htmlStirng, baseURL: nil) //변수에 저장한 html이 웹뷰에 나타남
    }
    // 파일 html읽기
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html") //htmlView.html파일 패쓰에대한 변수 생성
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url:myUrl)
        myWebView.load(myRequest)
    }
    
    // 정지
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    // 리로드
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    //앞으로
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    //뒤로
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

