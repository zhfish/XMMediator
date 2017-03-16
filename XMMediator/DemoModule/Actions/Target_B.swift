//
//  Target_B.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/16.
//  Copyright © 2017年 天星宿命. All rights reserved.
//

import Foundation
import UIKit


class Target_B: NSObject{
    
    func Action_startBoom(_ params: Dictionary<String, Any>?) -> NSNumber {
        print("booooom!!!")
        return true
    }
}
