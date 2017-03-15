//
//  XMMediator+Public.swift
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
    
    /// 远程调用入口
    ///
    /// - Parameters:
    ///   - url: 规则：scheme://[user]:[password]@[target]/[action]?[params]
    ///          URL例子: myapp://user:password@targetA/actionB?id=1234
    /// - Returns: 如果远程调用有返回值，则在此直接返回，如果没有调用，则返回nil
    public class func openURL(with urlString:String) -> Any? {
        return shared.openURL(with: urlString)
    }
    
    ///  本地组件调用入口
    ///
    /// - Parameters:
    ///   - targetName: 调用的类名
    ///   - actionName: 调用的方法名
    ///   - params: 传递的参数
    ///   - shouldCacheTarget: 是否缓存Target实例
    /// - Returns: 返回值，如果没有返回值，则返回nil
    public class func performTarget(with targetName: String, actionName: String, params: Dictionary<String,Any>, shouldCacheTarget: Bool) -> Any? {
        return shared.performTarget(with: targetName, actionName: actionName, params: params, shouldCacheTarget: shouldCacheTarget)
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
