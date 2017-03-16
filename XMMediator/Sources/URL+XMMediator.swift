//
//  URL+XMMediator.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/15.
//  Copyright © 2017年 天星宿命. All rights reserved.
//

import Foundation

// MARK: - URL扩展
extension URL {
    
    /// 获取Token
    public var xm_token : String? {
        get {
            guard password == nil else {
                return nil
            }
            return user
        }
    }
    
    /// 获取Target
    public var xm_target : String? {
        get {
            return host
        }
    }
    
    /// 获取Action
    public var xm_action : String? {
        get {
            guard pathComponents.count == 2 else {
                return nil
            }
            return lastPathComponent
        }
    }

    /// 解析query获取参数（带URLDecode）
    public var xm_params : Dictionary<String, String>?{
        get {
            guard let q = query else {
                return nil
            }
            
            let keyValues = q.components(separatedBy: "&")
            
            var results = [String:String]()
            
            for item in keyValues {
                let kvArray = item.components(separatedBy: "=")
                if kvArray.count > 1 {
                    results[kvArray[0].removingPercentEncoding!] = kvArray[1].removingPercentEncoding
                    
                }else {
                    results[kvArray[0].removingPercentEncoding!] = ""
                    
                }
            }
            return results
        }
    }
}
