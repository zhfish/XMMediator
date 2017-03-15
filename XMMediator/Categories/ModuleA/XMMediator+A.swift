//
//  XMMediator+A.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/5.
//  Copyright © 2017年 天星宿命. All rights reserved.
//
import UIKit

extension XMMediator {
    func A_viewController() -> UIViewController {
        let vc = self.performTarget(with: "A", actionName: "viewController1", params: nil, shouldCacheTarget: false) as! UIViewController
        return vc
    }
}
