//
//  ViewController.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/5.
//  Copyright © 2017年 天星宿命. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let a = XMMediatorConfig()
        a.URLRouteRuleFilePath = "aaa"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click(_ sender: UIButton) {
        self.navigationController?.pushViewController(XMMediator.shared.A_viewController(), animated: true)
    }

}

