//
//  A_viewcontroller.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/5.
//  Copyright © 2017年 天星宿命. All rights reserved.
//

import Foundation
import UIKit
class A_viewController: UIViewController {
    
    @IBAction func click(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
