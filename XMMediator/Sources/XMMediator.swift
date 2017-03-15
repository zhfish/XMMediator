//
//  XMMediator.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/5.
//  Copyright © 2017年 天星宿命. All rights reserved.
//
import Foundation

public class XMMediator : XMMediatorConfigProtocol {
    
    /// 单例
    public static let shared: XMMediator = {
        let instance = XMMediator()
        return instance
    }()
    
    /// 命名空间，namespace.target
    private let namespace : String
    
    /// target缓存
    private var targetCache : Dictionary<String, Any>
    
    /// 配置
    var config : XMMediatorConfig {
        didSet {
            updateConfig()
        }
    }
    
    /// 初始化
    private init() {
        namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        targetCache = [String:Any]()
        config = XMMediatorConfig()
        config.delegete = self
        updateConfig()
    }
    
    ///  本地组件调用入口
    ///
    /// - Parameters:
    ///   - targetName: 调用的类名
    ///   - actionName: 调用的方法名
    ///   - params: 传递的参数
    ///   - shouldCacheTarget: 是否缓存Target实例
    /// - Returns: 返回值，如果没有返回值，则返回nil
    func performTarget(with targetName: String, actionName: String, params: Dictionary<String,Any>?, shouldCacheTarget: Bool) -> Any! {
        
        let targetString = "Target_\(targetName)"
        let actionString = "Action_\(actionName):"
        
        var target = targetCache[targetString] as? NSObject
        if target == nil {
            guard let targetClass = NSClassFromString("\(namespace).\(targetString)") as? NSObject.Type else {
                return nil
            }
            
            target = targetClass.init()
        }
        
        let action = NSSelectorFromString(actionString)
        if shouldCacheTarget {
            targetCache[targetString] = target
        }
        
        guard target!.responds(to: action) else {
            clearTargetCache(with: targetString)
            return nil
        }
        
        return target!.perform(action, with: params).takeUnretainedValue()
    }
    
    /// 清除单个Target缓存
    ///
    /// - Parameter targetName: 调用的类名
    func clearTargetCache(with targetName: String) {
        let targetString = "Target_\(targetName)"
        targetCache.removeValue(forKey: targetString)
    }
    
    /// 清除所有Target缓存
    func clearTargetCacheWithAll() {
        targetCache.removeAll()
    }
    
    /// 刷新配置
    func updateConfig() {
        
    }
    
    

}
