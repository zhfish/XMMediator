//
//  XMMediatorConfig.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/5.
//  Copyright © 2017年 天星宿命. All rights reserved.
//

import Foundation
import UIKit

/// 配置
public class XMMediatorConfig {
    
    /// URL方式验证用 Token
    public var URLToken: String
    
    /// URL方式规则PList
    public var URLRouteRuleFilePath: String{
        didSet {
            delegete?.updateConfig()
        }
    }
    
    /// URL方式不验证Token
    public var isURLTokenVerifySkip: Bool

    /// URL方式不验证规则
    public var isURLRuleVerifySkip: Bool
        
    /// 回调
    var delegete: XMMediatorConfigProtocol?
    
    /// 初始化
    init() {
        URLToken = "XMMediator"
        URLRouteRuleFilePath = "XMMediatorConfig.plist"
        isURLTokenVerifySkip = true
        isURLRuleVerifySkip = true
    }
}
