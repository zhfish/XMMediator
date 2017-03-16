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
        XMMediator.config.URLRouteRulePath = Bundle.main.path(forResource: "rule", ofType: "json")!
        print(XMMediator.config.URLRouteRule!)
        XMMediator.config.isURLRuleVerifySkip = false
        XMMediator.config.isURLTokenVerifySkip = false
        XMMediator.config.URLToken = "test"
        print(XMMediator.canOpenURL(with: "xm://test@A/viewController"))
        print(XMMediator.canOpenURL(with: "xm://test@C/a"))
        print(XMMediator.canOpenURL(with: "xms://test@B/startBoom?cate=tnt&loc=tokyo"))
        print(XMMediator.shared.B_startBoom())
        print(XMMediator.shared.A_badge(with: 222))
        print(XMMediator.openURL(with: "xm://test@A/badge?fake=110") ?? false)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click(_ sender: UIButton) {
        self.navigationController?.pushViewController(XMMediator.shared.A_viewController(), animated: true)
    }

}

