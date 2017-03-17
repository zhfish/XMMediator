//
//  XMMediator+Router.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/5.
//  Copyright © 2017年 天星宿命. All rights reserved.
//

import Foundation


// MARK: - 路由支持扩展
extension XMMediator {
    
    /// 远程调用入口(有规则检查)
    ///
    /// - Parameters:
    ///   - url: 规则：scheme://[token]@[target]/[action]?[params]
    ///          URL例子: myapp://token@targetA/actionB?id=1234
    /// - Returns: 如果没有返回值，则返回nil
    public func openURL(with urlString:String) -> Any? {
        return openURL(with: urlString, isVerify: true)
    }
    
    /// 远程调用入口(可选规则检查)
    ///
    /// - Parameters:
    ///   - url: 规则：scheme://[token]@[target]/[action]?[params]
    ///          URL例子: myapp://token@targetA/actionB?id=1234
    ///   - isVerify: 使用规则检查
    /// - Returns: 如果没有返回值，则返回nil
    public func openURL(with urlString:String, isVerify:Bool) -> Any? {
        guard let url = URL(string: urlString) else {
            return false
        }
        
        guard isVerify && validationRule(URL: url) else {
            return false
        }
        
        return performWith(targetName: url.xm_target!, actionName: url.xm_action!, params: url.xm_params, shouldCacheTarget: false)
    }
    
    /// 远程调用规则检查
    ///
    /// - Parameter urlString: url字符串
    /// - Returns: 返回布尔值，表示是否可以远程调用
    public func canOpenURL(with urlString:String) -> Bool {
        guard let url = URL(string: urlString) else {
            return false
        }
        
        return validationRule(URL: url)
    }

    
    /// 验证规则
    ///
    /// - Parameter url: url类
    /// - Returns: 返回布尔值
    private func validationRule(URL url:URL) -> Bool {
        //判断token
        guard config.isURLTokenVerifySkip == true ,
              url.xm_token == config.URLToken  else {
            return false
        }
        
        guard config.isURLRuleVerifySkip == false else {
            return true
        }
        
        guard let rule = config.URLRouteRule else {
            return false
        }
        
        guard let scheme = url.scheme else {
            return false
        }
        
        guard rule.schemes.contains(scheme) else {
            return false
        }
        
        guard let target = url.xm_target else {
            return false
        }
        guard let action = url.xm_action else {
            return false
        }

        let target_array = rule.targets[target]
        var action_find = false
        if target_array != nil {
            if target_array!.count == 0 {
                action_find = true
            }
            else {
                action_find = target_array!.contains(action)

            }
        }
        
        switch rule.defaultRule {
        case "allow":
            guard action_find == false else {
                return false
            }
            break
        case "deny":
            guard action_find == true else {
                return false
            }
            break
        default:
            return false
        }
        
        return true
    }
}
