//
//  ViewControllerMain.swift
//  Wao
//
//  Created by zhaochenjun on 16/1/6.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

class ViewControllerMain: UIViewController ,UIScrollViewDelegate{
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    
    @IBOutlet weak var imagePageController: UIPageControl!
	
    var timer:NSTimer!
	
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var cellItemWidth = Float(0.0)
    var dataSource = NSMutableArray()
    var controlAnim = NSMutableArray()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imagePageController)

        let singleTap = UITapGestureRecognizer.init(target: self, action: "hangleSingleTap")
        self.imageScrollView.addGestureRecognizer(singleTap)//scrollView点击跳转
        
		
		self.CollectionView.alwaysBounceVertical = true
        self.CollectionView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0)
        imageGallery()
        
        let cellGoodsNib = UINib(nibName: "WaterCellMain", bundle: nil)
        self.CollectionView.registerNib(cellGoodsNib, forCellWithReuseIdentifier: "WaterCellMain")
        
        // Do any additional setup after loading the view, typically from a nib.
        let tempArray = ["1.JPG","5.JPG","6.JPG","4.JPG","6.JPG","2.JPG","5.JPG","4.JPG"]
        dataSource.addObjectsFromArray(tempArray)
        let TempAni = NSMutableArray()
        for _ in 0..<dataSource.count {
            TempAni.addObject("false")
            
        }
        controlAnim = TempAni
    }
    
    
    func hangleSingleTap(){
        
        var storyboard: UIStoryboard
        storyboard = UIStoryboard.init(name: "SBZTMain", bundle: nil)
        
        var viewController: ZTViewController
        viewController = storyboard.instantiateViewControllerWithIdentifier("ZTViewController") as! ZTViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @IBAction func backTopAction(sender: AnyObject) {
        
        CollectionView.setContentOffset(CGPointMake(0, -15), animated: true)

    }

}

extension ViewControllerMain:UICollectionViewDelegate,UICollectionViewDataSource,WaterfallMainProtocol{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return dataSource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("WaterCellMain", forIndexPath: indexPath) as! WaterCellMain
        
        //重新调整图片的大小  按比例调整到宽度为cellItemWidth的情况
        cell.ImageView.image = UIImage(named: dataSource[indexPath.row] as! String)
        if controlAnim[indexPath.row] as! String == "false"{
            displayCellAnimation(cell.contentView)
            controlAnim[indexPath.row] = "true"
        }
        
        
        return cell
    }
    
    func displayCellAnimation(view:UIView){
        view.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
        //动画效果
        UIView.animateWithDuration(0.3, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 7, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            view.transform = CGAffineTransformIdentity
            
            }) { (success) -> Void in
                
        }
    }
    
    //waterfallProtocol询问cell高度的代理
    func collectionView_heightForItemAtIndexPath(view:UICollectionView, layout:WaterLayoutMain,path Path:NSIndexPath)->Float{
        let origiImage = UIImage(named: dataSource[Path.row] as! String)!
        let origiImageWidth = UIImage(named: dataSource[Path.row] as! String)!.size.width

        let cellItemHeight = origiImage.size.height * (CGFloat(cellItemWidth)/origiImageWidth)
        
        return Float(cellItemHeight)
    }
    
    func waterfall_itemWidth(itemWidth: Float) {
        cellItemWidth = itemWidth
    }
	
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		
		var storyboard: UIStoryboard
		storyboard = UIStoryboard.init(name: "SBGiftlistMain", bundle: nil)
		
		var viewControllerMain: ViewControllerGiftListMain
		viewControllerMain = storyboard.instantiateViewControllerWithIdentifier("ViewControllerGiftListMain") as! ViewControllerGiftListMain
        // 隐藏tableBar
		viewControllerMain.hidesBottomBarWhenPushed = true
        
		self.navigationController?.pushViewController(viewControllerMain, animated: true)
	}
    
    
    
    func imageGallery(){
		self.imageScrollView.pagingEnabled = true;
		self.imageScrollView.contentOffset = CGPointMake(0, 0);
		
        let imageWidth:CGFloat = ScreenWidth
        let imageHeight:CGFloat = ScreenWidth * 260 / 640
        let imageY:CGFloat = 0
        let totalCount:NSInteger = 4
		
        for index in 0..<totalCount{
            let imageView:UIImageView = UIImageView()
            imageView.contentMode = UIViewContentMode.ScaleAspectFill
            let imageX:CGFloat = CGFloat(index) * imageWidth
			imageView.clipsToBounds = true
            imageView.frame = CGRectMake(imageX, imageY, imageWidth, imageHeight)//设置图片的大小，注意Image和ScrollView的关系，其实几张图片是按顺序从左向右依次放置在ScrollView中的，但是ScrollView在界面中显示的只是一张图片的大小，效果类似与画廊；
//            let name:String = String(format: "%d.JPG", index+1)
//            imageView.image = UIImage(named: name)
            if index == 0{
                imageView.image = UIImage(named: "4.JPG")
            } else if index == 3{
                imageView.image = UIImage(named: "1.JPG")
            } else {
                let name:String = String(format: "%d.JPG", index+1)
                imageView.image = UIImage(named: name)
            }
            self.imageScrollView.addSubview(imageView);//把图片加入到ScrollView中去，实现轮播的效果；
        }
		let contentW:CGFloat = imageWidth * CGFloat(totalCount)//这里的宽度就是所有的图片宽度之和；
		self.imageScrollView.contentSize = CGSizeMake(contentW, 0)
		self.imageScrollView.delegate = self
		self.imagePageController.numberOfPages = totalCount//下面的页码提示器；
        self.addTimer()
    }
    
	
    func nextImage(sender:AnyObject!){//图片轮播；
		
        var page:Int = self.imagePageController.currentPage;
        if(page == 3){   //循环；
            page = 0
        }else{
            page++
        }
        let x:CGFloat = CGFloat(page) * ScreenWidth
		
        self.imageScrollView.setContentOffset(CGPointMake(x, 0), animated: true)//注意：contentOffset就是设置ScrollView的偏移；
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        // 开始拖动,timer暂停
        timer.invalidate()
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if imageScrollView.contentOffset.x == 0{
            imageScrollView.contentOffset = CGPointMake(3 * imageScrollView.frame.size.width, 0)
        } else if imageScrollView.contentOffset.x == 3 * imageScrollView.frame.size.width{
            imageScrollView.contentOffset = CGPointMake(0, 0)
        }
        
    }
    
    
    //UIScrollViewDelegate中重写的方法；
    //处理所有ScrollView的滚动之后的事件，注意 不是执行滚动的事件；
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //这里的代码是在ScrollView滚动后执行的操作，并不是执行ScrollView的代码；
        //这里只是为了设置下面的页码提示器；该操作是在图片滚动之后操作的；
        let scrollviewW:CGFloat = imageScrollView.frame.size.width
        let x:CGFloat = imageScrollView.contentOffset.x
        let page:Int = (Int)((x + scrollviewW / 2) / scrollviewW)
        self.imagePageController.currentPage = page
        
    }
    
    func addTimer(){   //图片轮播的定时器；
        self.timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "nextImage:", userInfo: nil, repeats: true)
    }
    
    
}
