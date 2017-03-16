//
//  XMMediator+B.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/16.
//  Copyright © 2017年 天星宿命. All rights reserved.
//

import Foundation

extension XMMediator {
    func B_startBoom() -> Bool {
        let result = self.performWith(targetName: "B", actionName: "startBoom", params: nil, shouldCacheTarget: false) as! Bool
        return result
    }

}
