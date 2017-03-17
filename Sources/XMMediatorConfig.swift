//
//  XMMediatorConfig.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/5.
//  Copyright © 2017年 天星宿命. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

public class XMMediatorRule : Mappable {
    
    var schemes : [String]!
    var defaultRule : String!
    var targets : [String : [String]] = [:]
    
    required public init?(map: Map) {
        if map.JSON["schemes"] == nil ||
           map.JSON["default"] == nil ||
           map.JSON["targets"] == nil
        {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        schemes <- map["schemes"]
        defaultRule <- map["default"]
        targets <- map["targets"]
    }
}

/// 配置
public class XMMediatorConfig {
    
    /// URL路由验证用 Token
    public var URLToken: String
    
    /// URL路由规则Json
    public var URLRouteRule: XMMediatorRule?
    
    /// 通过路径设置URL路由规则Json
    public var URLRouteRulePath: String {
        didSet {
            URLRouteRule = nil
            
            let url = URL(fileURLWithPath: URLRouteRulePath)
            
            guard let json = try? String(contentsOf: url) else {
                return
            }
            
            URLRouteRule =  XMMediatorRule(JSONString: json)
        }
    }
    
    /// URL路由不验证Token
    public var isURLTokenVerifySkip: Bool

    /// URL路由不验证规则
    public var isURLRuleVerifySkip: Bool
        
    /// 初始化
    init() {
        URLToken = "XMMediator"
        URLRouteRule = nil
        URLRouteRulePath = ""
        isURLTokenVerifySkip = true
        isURLRuleVerifySkip = true
    }
}
