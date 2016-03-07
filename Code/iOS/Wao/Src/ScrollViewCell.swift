//
//  ScrollViewCell.swift
//  悬停header view
//
//  Created by 袁思曾 on 16/1/21.
//  Copyright © 2016年 袁思曾. All rights reserved.
//

import UIKit

class ScrollViewCell: UITableViewCell,UIScrollViewDelegate {

    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var GiftImage: UIImageView!
    
    @IBOutlet weak var PageControl: UIPageControl!
    
    var timer:NSTimer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageGallery()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func displayCellAnimation(view:UIView){
        view.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
        //动画效果
        UIView.animateWithDuration(0.3, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 7, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            view.transform = CGAffineTransformIdentity
            
            }) { (success) -> Void in
                
        }
    }
    func imageGallery(){
        contentView.addSubview(PageControl)
        
        let imageWidth:CGFloat = UIScreen.mainScreen().bounds.width
        let imageHeight:CGFloat = self.ScrollView.bounds.size.height
        let imageY:CGFloat = 0
        let totalCount:NSInteger = 4
        for index in 0..<totalCount{
            let imageView:UIImageView = UIImageView();
            imageView.contentMode = UIViewContentMode.ScaleAspectFill
            let imageX:CGFloat = CGFloat(index) * imageWidth;
            imageView.frame = CGRectMake(imageX, imageY, imageWidth, imageHeight);//设置图片的大小，注意Image和ScrollView的关系，其实几张图片是按顺序从左向右依次放置在ScrollView中的，但是ScrollView在界面中显示的只是一张图片的大小，效果类似与画廊；
            let name:String = String(format: "%d.JPG", index+1);
            imageView.image = UIImage(named: name);
            self.ScrollView.showsHorizontalScrollIndicator = false;//不设置水平滚动条；
            self.ScrollView.addSubview(imageView);//把图片加入到ScrollView中去，实现轮播的效果；
            
            //需要非常注意的是：ScrollView控件一定要设置contentSize;包括长和宽；
            let contentW:CGFloat = imageWidth * CGFloat(totalCount);//这里的宽度就是所有的图片宽度之和；
            self.ScrollView.contentSize = CGSizeMake(contentW, 0);
            self.ScrollView.pagingEnabled = true;
            self.ScrollView.delegate = self;
            self.PageControl.numberOfPages = totalCount;//下面的页码提示器；
            
            
        }
        
        self.addTimer()
        
    }
	
    func nextImage(sender:AnyObject!){//图片轮播；

        var page:Int = self.PageControl.currentPage;
        if(page == 3){   //循环；
            page = 0;
        }else{
            page++;
        }
        let x:CGFloat = CGFloat(page) * self.ScrollView.frame.size.width;
        
        self.ScrollView.contentOffset = CGPointMake(x, 0);//注意：contentOffset就是设置ScrollView的偏移；
    }
    
    //UIScrollViewDelegate中重写的方法；
    //处理所有ScrollView的滚动之后的事件，注意 不是执行滚动的事件；
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //这里的代码是在ScrollView滚动后执行的操作，并不是执行ScrollView的代码；
        //这里只是为了设置下面的页码提示器；该操作是在图片滚动之后操作的；
        let scrollviewW:CGFloat = ScrollView.frame.size.width;
        let x:CGFloat = ScrollView.contentOffset.x;
        let page:Int = (Int)((x + scrollviewW / 2) / scrollviewW);
        self.PageControl.currentPage = page;
        
    }
    
    func addTimer(){   //图片轮播的定时器；
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "nextImage:", userInfo: nil, repeats: true);
    }

    
}