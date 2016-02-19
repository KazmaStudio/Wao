//
//  PaysuccessViewController.swift
//  Wao
//
//  Created by 华瑞金科 on 16/2/3.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class PaysuccessViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = "这个杯子我想要很久了,姐姐妹妹们,凑个单给我买个吧!哈哈!"
        nameLabel.text = "顾小云"
        
        
    }

    @IBAction func rootViewAct(sender: AnyObject) {
        
        navigationController?.popToRootViewControllerAnimated(true)
        
        
    }
    
    

}

extension PaysuccessViewController: UITextViewDelegate{
    func textViewDidChange(textView: UITextView) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 20
        
//        var attributes = NSDictionary()
//        attributes = NSFontAttributeName(UIFont.systemFontOfSize(15)),
        
        
        
        
        
        
        
        
    }
}