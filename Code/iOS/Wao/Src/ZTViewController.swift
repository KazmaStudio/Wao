//
//  ViewController.swift
//  zhuanti
//
//  Created by 袁思曾 on 16/2/1.
//  Copyright © 2016年 袁思曾. All rights reserved.
//

import UIKit

class ZTViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var heightList:NSMutableArray = []
    
    var dataList:NSMutableArray = ["adad", "323asdkjhaskjdhkjsdhflsahdlfjsahdfh423", "sdsjdjsjsavksabdjbsavjksdkjvskjfhakjsfksjabjs撒就看到噶刷卡机大世界快点回家安师大哈好是否会静安寺街道静安寺大家看法那是假的还放假撒旦法，as，发舒服吗，暗示法你撒，弄付，吗什么呢，非你莫属，啊风马牛，啊是你吗，风马牛，三方面四大美女，烦恼吗什么地方你们呢，爱似麻烦男什么方面那什么，哪方面你，啊什么，弄付那么，萨芬娜什么呢，FM那MSN，烦恼吗什么呢，发那么多是你吗贩卖那，是你吗发没你事风马牛，啊什么呢，发你，按摩手法abjksdjksdbfjksabdfjksbdfksfjasfhasdfbjhsdfhjsdf"]
    
    var imageList = ["1.JPG","2.JPG","3.JPG"]
    
    
    
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let Nib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.registerNib(Nib, forCellReuseIdentifier: "TableViewCell")
        
        for (var i = 0; i < dataList.count; i++){
            
            let textView: UITextView = UITextView.init(frame: CGRectMake(0, 0, 414-60, 0))
            
            textView.text = dataList[i] as! String
            
            textView.sizeToFit()
            
            heightList.addObject(textView.frame.size.height as CGFloat)
        }
        
        print(heightList)
        
       


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath) as! TableViewCell
        
        
        print(heightList[indexPath.row] as! CGFloat)
        
        cell.GiftDescribe.text = dataList[indexPath.row] as! String
        cell.cHeight.constant = heightList[indexPath.row] as! CGFloat
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let widthImage = UIScreen.mainScreen().bounds.width - 60
        
        let heightImage = widthImage * 18/29
        
        let heightOther = heightImage + 150
        
        return heightList[indexPath.row] as! CGFloat + heightOther
    }
    
    
}

