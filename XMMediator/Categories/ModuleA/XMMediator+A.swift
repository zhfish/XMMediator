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
        let vc = performWith(targetName: "A", actionName: "viewController", params: nil, shouldCacheTarget: false) as! UIViewController
        return vc
        
    }
    
    func A_badge(with fake:Int) -> Int {
        let result = performWith(targetName: "A", actionName: "badge", params: ["fake":String(fake)], shouldCacheTarget: false) as! Int
        return result
    }
}
