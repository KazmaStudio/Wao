//
//  ViewController.swift
// 
//
//  Created by 袁思曾 on 16/1/7.
//  Copyright © 2016年 袁思曾. All rights reserved.
//

import UIKit

class ViewControllerGiftListMain: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    
    var cellItemWidth = Float(0.0)
    var dataSource = NSMutableArray()
    var controlAnim = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
        let cellGoodsNib = UINib(nibName: "ViewControllerGiftList", bundle: nil)
        self.CollectionView.registerNib(cellGoodsNib, forCellWithReuseIdentifier: "ViewControllerGiftList")
        
        // Do any additional setup after loading the view, typically from a nib.
        let tempArray = ["1.JPG","2.JPG","3.JPG","4.JPG","1.JPG","2.JPG","3.JPG","4.JPG","1.JPG","2.JPG","3.JPG","4.JPG"]
        dataSource.addObjectsFromArray(tempArray)
        let TempAni = NSMutableArray()
        for _ in 0..<dataSource.count {
            TempAni.addObject("false")
            
        }
        controlAnim = TempAni
        
        
        addDetailView()
        //
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addDetailView(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "addView", name: "detail", object: nil)
    }
    
    func addView(){
        
        let SBDetailVC =  UIStoryboard(name:"SBDetailMain",bundle: nil).instantiateViewControllerWithIdentifier("SBDetailViewController") as! SBDetailViewController
        navigationController?.pushViewController(SBDetailVC, animated: true)
    }




}
extension ViewControllerGiftListMain:UICollectionViewDelegate,UICollectionViewDataSource,WaterfallProtocol{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return dataSource.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ViewControllerGiftList", forIndexPath: indexPath) as! ViewControllerGiftList
        
        cell.backgroundColor = UIColor.whiteColor()
       
        
       // UIImage.init(named: <#T##String#>)
        
        //重新调整图片的大小  按比例调整到宽度为cellItemWidth的情况
        cell.giftImageView.image = UIImage(named: dataSource[indexPath.row] as! String)!
        cell.giftNameLabel.text = "111"
        cell.giftDescribeLabel.text = "22222"
        
        if controlAnim[indexPath.row] as! String == "false"{
            displayCellAnimation(cell.contentView)
            controlAnim[indexPath.row] = "true"
        }
    
        
        return cell
    }
	
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		
		var storyboard: UIStoryboard
		storyboard = UIStoryboard.init(name: "SBDetailMain", bundle: nil)
		
		var viewControllerMain: SBDetailViewController
		viewControllerMain = storyboard.instantiateViewControllerWithIdentifier("SBDetailViewController") as! SBDetailViewController
		
		self.navigationController?.pushViewController(viewControllerMain, animated: true)
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
    func collectionView_heightForItemAtIndexPath(view:UICollectionView, layout:WaterLayout,path Path:NSIndexPath)->Float{
		
       // let origiImage = UIImage(named: dataSource[Path.row] as! String)!
        
      //  let origiImageWidth = UIImage(named: dataSource[Path.row] as! String)!.size.width
        
        

        let cellItemHeight = ((cellItemWidth-10)*(280/260) + 85)
        
        return Float(cellItemHeight)
    }
    
    func waterfall_itemWidth(itemWidth: Float) {
        cellItemWidth = itemWidth
    }

    
}

