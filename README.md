# XMMediator
---- 
[![CocoaPods](https://img.shields.io/cocoapods/v/XMMediator.svg)](https://github.com/zhfish/XMMediator)
[![Build Status](https://travis-ci.org/zhfish/XMMediator.svg?branch=master)](https://travis-ci.org/zhfish/XMMediator) 
## 概述
基本思想来源于[CTMediator](https://github.com/casatwy/CTMediator)，以Target-Action方式做模块间的解耦。  
基于此，添加了带规则的URLRoute方式，保证不会被外部随意调用，也免去了需要注册的麻烦
## 集成
### source
直接把Sources目录拖入工程  
需要第三方类库 ObjectMapper
### cocoapods
coming soon
## 使用
### 初始化
如果不用URLRoute方式，不用任何初始化

```
//根据路径加载Rule
XMMediator.config.URLRouteRulePath = Bundle.main.path(forResource: "rule", ofType: "json")!
//开启Rule认证
XMMediator.config.isURLRuleVerifySkip = false
//开启Token认证
XMMediator.config.isURLTokenVerifySkip = false
```
### 调用方

```
import UIKit

extension XMMediator {
    //返回Controller
    func A_viewController() -> UIViewController {
        let vc = performWith(targetName: "A", actionName: "viewController", params: nil, shouldCacheTarget: false) as! UIViewController
        return vc
        
    }
    //带参数示例
    func A_badge(with fake:Int) -> Int {
        let result = performWith(targetName: "A", actionName: "badge", params: ["fake":String(fake)], shouldCacheTarget: false) as! Int
        return result
    }
}
```
调用方通过XMMediator调用不知道在哪里的Target  
这也是暴露在模块外的方法  
接收的返回值是NSObject
### 被调用方

```
import Foundation
import UIKit


class Target_A : NSObject{
    
    func Action_viewController(_ params: Dictionary<String, Any>?) -> UIViewController {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "A")
        return vc
    }
    
    func Action_badge(_ params: Dictionary<String, Any>?) -> NSNumber {
        guard let fake = params?["fake"] as? String else {
            return 520
        }
        
        return Int(fake)!as NSNumber
    }
}
```

被调用方接收请求  
定义类 Target_XXX ，继承自NSObject  
类里面定义 Action_XXX  
返回值是NSObject

### URLRoute + Rule
规则：scheme://[token]@[target]/[action]?[params]  
示例：xm://test@B/badge?fake=520  
1. 因为这里传的都是字符串，所以处理参数时要注意
2. 中文可以裸传，但是要传`/&?`这样的字符，需要URLEncode

#### Rule规则介绍

```
{
// 可以接收的scheme
    "schemes": [
                "xm",
                "xms"
                ],
// 默认规则，deny or allow
    "default": "deny",
// 特权规则
// 如果默认deny，那么targets里的视为allow
// 如果默认allow，那么targets里的视为deny
// targets是字典，他下面的Action是数组
    "targets": {
        "A": [
              "badge"
              ],
        "B": []
    }
}
```
## 开源许可证
MIT

## 持续更新中，有任何意见建议请Issues

