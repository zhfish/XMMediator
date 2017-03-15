//
//  URL+XMMediator.swift
//  XMMediator
//
//  Created by 王晨 on 2017/3/15.
//  Copyright © 2017年 天星宿命. All rights reserved.
//

import Foundation

extension URL {
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
