//
//  ViewController.swift
//  悬停header view
//
//  Created by 袁思曾 on 16/1/21.
//  Copyright © 2016年 袁思曾. All rights reserved.
//

import UIKit

class SBDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, UIWebViewDelegate {
	
    
	@IBOutlet weak var TableView: UITableView!
	
	var webView:UIWebView!
	
	var webViewHeight: CGFloat! = 0
	
    var footVie: UIView!
    var boudsView: UIView!
    var longpressGesutre:UITapGestureRecognizer!
    
	override func viewDidLoad() {
		super.viewDidLoad()
		let cellGoodsNib = UINib(nibName: "ScrollViewCell", bundle: nil)
		self.TableView.registerNib(cellGoodsNib, forCellReuseIdentifier: "ScrollViewCell")
		
		let header = UINib(nibName: "buttonHeader", bundle: nil)
		self.TableView.registerNib(header, forHeaderFooterViewReuseIdentifier: "buttonHeader")
		
		webView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 0))
		
		webView.delegate = self
		
		webView.scrollView.scrollEnabled = false
		
		webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://github.com")!))
		addPrinceView()
	}
    
    func addPrinceView(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "addView", name: "price", object: nil)
    }
    
    func addView(){
        
        let view = NSBundle.mainBundle().loadNibNamed("Animation", owner: nil, options: nil).first as! AnimationView
		
		view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight)
		view.layoutIfNeeded()
		
        self.view.addSubview(view)
    }
    
    func tapAction(){
        print(1111)
    }
    
    func handleTappressGesture(){
        
        UIView.animateWithDuration(0.5, animations: hideAnimation, completion: {finished in
        self.boudsView.hidden = true

        })
    }
    func hideAnimation(){
        footVie.frame = CGRectMake(0, self.view.frame.height, self.view.frame.width, 1)
    }
    
    func animation(){
        footVie.frame = CGRectMake(0, 400, self.view.frame.width, self.view.frame.height - 400)
    }
    
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
		return 1
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		if indexPath.section == 0{
			return ScreenWidth * 320 / 600
		}else {
			return webViewHeight
		}
	}
	
	
	
	func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		
		if( section == 1 ){
			
			let viewHeader = tableView.dequeueReusableHeaderFooterViewWithIdentifier("buttonHeader") as! buttonHeader
			
			let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
			let blurEffectView = UIVisualEffectView(effect: blurEffect)
			blurEffectView.frame = viewHeader.bounds
			viewHeader.viewBG.addSubview(blurEffectView)
			
			return viewHeader
		}else{
			return nil
		}
		
	}
	
	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		
		switch (section){
		case 0:
			return 0
			// break
		case 1:
			return 94
			//break
		default:
			break
		}
		
		return 0
	}
	
	
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
		
		// indexpath.section == 0 && indexPath.row == 0
		
		if ( indexPath.section == 0 && indexPath.row == 0){
			
			let cell = TableView.dequeueReusableCellWithIdentifier("ScrollViewCell") as! ScrollViewCell
			
			return cell
		}
		
		if ( indexPath.section == 1 && indexPath.row == 0){
			
			let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
			
			print(cell.contentView.subviews.count)
			
			cell.contentView.addSubview(webView)
			
			return cell
		}
		
		return UITableViewCell()
		// indexPath.section == 1 && indexPath.row == 0
		
		// return webview
		
	}
	
	func webViewDidFinishLoad(webView: UIWebView) {
		
		var frame = webView.frame
		frame.size.height = 1
		webView.frame = frame
		let fittingSize = webView.sizeThatFits(CGSizeZero)
		frame.size = fittingSize
		webView.frame = frame;
		
		webViewHeight = frame.size.height
		
		self.TableView.beginUpdates()
		self.TableView.endUpdates()
	}
	
}

