//
//  XMMediator+Router.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/5.
//  Copyright © 2017年 天星宿命. All rights reserved.
//

import Foundation


// MARK: - 路由支持扩展
public extension XMMediator {
    
    /// 远程调用入口(有规则检查)
    ///
    /// - Parameters:
    ///   - url: 规则：scheme://[token]@[target]/[action]?[params]
    ///          URL例子: myapp://token@targetA/actionB?id=1234
    /// - Returns: 返回值，如果没有返回值，则返回nil
    func openURL(with urlString:String) -> Any? {
        return openURL(with: urlString, isVerify: true)
    }
    
    /// 远程调用入口(可选规则检查)
    ///
    /// - Parameters:
    ///   - url: 规则：scheme://[token]@[target]/[action]?[params]
    ///          URL例子: myapp://token@targetA/actionB?id=1234
    ///   - isVerify: 使用规则检查
    /// - Returns: 返回值，如果没有返回值，则返回nil
    func openURL(with urlString:String, isVerify:Bool) -> Any? {
        return nil
    }
    
    func canOpenURL(with urlString:String) -> Bool {
        guard let url = URL(string: urlString) else {
            return false
        }
        
        return validationRule(URL: url)
    }

    
    private func validationRule(URL url:URL) -> Bool {
        //判断token
        if config.isURLTokenVerifySkip == false {
            guard let token = url.user else {
                return false
            }
            guard token != config.URLToken else {
                return false
            }
        }
        
        //判断scheme
        guard let scheme = url.scheme else {
            return false
        }
        
        
    }
    


}
