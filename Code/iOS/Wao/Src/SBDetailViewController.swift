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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellGoodsNib = UINib(nibName: "ScrollViewCell", bundle: nil)
        self.TableView.registerNib(cellGoodsNib, forCellReuseIdentifier: "ScrollViewCell")
        
        let header = UINib(nibName: "buttonHeader", bundle: nil)
        self.TableView.registerNib(header, forHeaderFooterViewReuseIdentifier: "buttonHeader")

        
        }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 250
        }else {
            return 1000
        }
        
    
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls
    
   
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if( section == 1 ){
            
            let viewHeader = tableView.dequeueReusableHeaderFooterViewWithIdentifier("buttonHeader") as! buttonHeader
            
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
            return 200
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
            
            let webView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 1000))
            
            webView.delegate = self
            
            webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://github.com")!))
            
            webView.backgroundColor = UIColor.redColor()
            
            cell.contentView.addSubview(webView)
            
            
            return cell
        }
        
        return UITableViewCell()
        // indexPath.section == 1 && indexPath.row == 0
        
        // return webview

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func webViewDidFinishLoad(webView: UIWebView) {
    }

}

