//
//  XMMediator+Shared.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/5.
//  Copyright © 2017年 天星宿命. All rights reserved.
//

import Foundation

// MARK: - 单例支持扩展
public extension XMMediator {
    
    /// 配置
    public static var config : XMMediatorConfig {
        get {
            return shared.config
        }
        set {
            shared.config = newValue
        }
    }
    
    /// 远程调用入口(有规则检查)
    ///
    /// - Parameters:
    ///   - url: 规则：scheme://[token]@[target]/[action]?[params]
    ///          URL例子: myapp://token@targetA/actionB?id=1234
    /// - Returns: 如果没有返回值，则返回nil
    public class func openURL(with urlString:String) -> Any? {
        return openURL(with: urlString, isVerify: true)
    }
    
    /// 远程调用入口(可选规则检查)
    ///
    /// - Parameters:
    ///   - url: 规则：scheme://[token]@[target]/[action]?[params]
    ///          URL例子: myapp://token@targetA/actionB?id=1234
    ///   - isVerify: 使用规则检查
    /// - Returns: 如果没有返回值，则返回nil
    public class func openURL(with urlString:String, isVerify:Bool) -> Any? {
        return shared.openURL(with: urlString, isVerify: isVerify)
    }
    
    /// 远程调用规则检查
    ///
    /// - Parameter urlString: url字符串
    /// - Returns: 返回布尔值，表示是否可以远程调用
    public class func canOpenURL(with urlString:String) -> Bool {
        return shared.canOpenURL(with: urlString)
    }

    ///  本地组件调用入口
    ///
    /// - Parameters:
    ///   - targetName: 调用的类名
    ///   - actionName: 调用的方法名
    ///   - params: 传递的参数
    ///   - shouldCacheTarget: 是否缓存Target实例
    /// - Returns: 返回值，如果没有返回值，则返回nil
    public class func performWith(targetName: String, actionName: String, params: Dictionary<String,Any>, shouldCacheTarget: Bool) -> Any? {
        return shared.performWith(targetName: targetName, actionName: actionName, params: params, shouldCacheTarget: shouldCacheTarget)
    }
    
    /// 清除单个Target缓存
    ///
    /// - Parameter targetName: 调用的类名
    public class func clearTargetCache(with targetName: String) {
        shared.clearTargetCache(with: targetName)
    }
    
    /// 清除所有Target缓存
    public class func clearTargetCacheWithAll() {
        shared.clearTargetCacheWithAll()
    }
}
