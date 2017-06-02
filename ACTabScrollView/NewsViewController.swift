//
//  NewsViewController.swift
//  ACTabScrollView
//
//  Created by AzureChen on 2015/8/19.
//  Copyright (c) 2015年 AzureChen. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, ACTabScrollViewDelegate, ACTabScrollViewDataSource {

    @IBOutlet weak var tabScrollView: ACTabScrollView!
    
    var contentViews: [UIView] = []
    var category : [String] = ["Yesterday \n 01 May 2017","Today \n02 May 2017"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set ACTabScrollView, all the following properties are optional
        tabScrollView.defaultPage = 0
        tabScrollView.arrowIndicator = true
//        tabScrollView.tabSectionHeight = 40
//        tabScrollView.tabSectionBackgroundColor = UIColor.whiteColor()
//        tabScrollView.contentSectionBackgroundColor = UIColor.whiteColor()
//        tabScrollView.tabGradient = true
//        tabScrollView.pagingEnabled = true
//        tabScrollView.cachedPageLimit = 3
        
        tabScrollView.delegate = self
        tabScrollView.dataSource = self
        
        // create content views from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        for category in NewsCategory.allValues() {
            let vc = storyboard.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
            vc.category = category
            
            addChildViewController(vc) // don't forget, it's very important
            contentViews.append(vc.view)
        }
        
        // set navigation bar appearance
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.isTranslucent = false
            navigationBar.tintColor = UIColor.white
            navigationBar.barTintColor = UIColor(red: 38.0 / 255, green: 191.0 / 255, blue: 140.0 / 255, alpha: 1)
            navigationBar.titleTextAttributes = NSDictionary(object: UIColor.white, forKey: NSForegroundColorAttributeName as NSCopying) as? [String : AnyObject]
            navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            navigationBar.shadowImage = UIImage()
        }
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }
    
    // MARK: ACTabScrollViewDelegate
    func tabScrollView(_ tabScrollView: ACTabScrollView, didChangePageTo index: Int) {
        print(index)
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, didScrollPageTo index: Int) {
    }
    
    // MARK: ACTabScrollViewDataSource
    func numberOfPagesInTabScrollView(_ tabScrollView: ACTabScrollView) -> Int {
        return NewsCategory.allValues().count
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, tabViewForPageAtIndex index: Int) -> UIView {
        // create a label
        let label = UILabel()
        label.text = String(describing: category[index])
        if #available(iOS 8.2, *) {
            label.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightBold)
        } else {
            label.font = UIFont.systemFont(ofSize: 16)
        }
        label.textColor = UIColor.white
        label.textAlignment = .center
        
        // if the size of your tab is not fixed, you can adjust the size by the following way.
        //label.sizeToFit() // resize the label to the size of content
        label.numberOfLines = 0
        label.frame.size = CGSize(width: label.frame.size.width + 150, height: label.frame.size.height + 60) // add some paddings
        
        return label
    }
    
    func tabScrollView(_ tabScrollView: ACTabScrollView, contentViewForPageAtIndex index: Int) -> UIView {
        return contentViews[index]
    }
}

