//
//  Target_A.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/5.
//  Copyright © 2017年 天星宿命. All rights reserved.
//

import Foundation
import UIKit


class Target_A : NSObject{
    
    func Action_viewController(_ params: Dictionary<String, Any>?) -> UIViewController {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "A")
        return vc
    }
    
    func Action_badge(_ params: Dictionary<String, Any>?) -> NSNumber {
        guard let fake = params?["fake"] as? String else {
            return 520
        }
        
        return Int(fake)!as NSNumber
    }
}
