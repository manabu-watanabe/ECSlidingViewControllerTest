//
//  TopViewController.swift
//  ECSlidingViewControllerTest
//
//  Created by 渡部 on 2015/02/24.
//  Copyright (c) 2015年 watanabe. All rights reserved.
//

import Foundation
import UIKit

class TopViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        var appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        //シャドウの設定
        self.view.layer.shadowOpacity = 0.5
        self.view.layer.shadowRadius = 5.0
        self.view.layer.shadowColor = UIColor.grayColor().CGColor
        
        // MenuViewControllerを取得して、ECSlidingViewControllerのunderLeftViewController に設定
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        appDelegate.slidingViewController?.underLeftViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Menu") as UIViewController
    
        self.view.addGestureRecognizer(appDelegate.slidingViewController!.panGesture)
        appDelegate.slidingViewController?.anchorRightPeekAmount = 250.0 // スライド時にTOPが見えてる範囲
        
    }
}