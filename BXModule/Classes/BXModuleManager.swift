//
//  BXModuleManager.swift
//  Pods
//
//  Created by Haizhen Lee on 11/14/16.
//
//

import Foundation


open class BXModuleManager: NSObject{
  public static var shared = BXModuleManager()
  private var _modules = [BXModule]()
  
  public func all() -> [BXModule]{
      return _modules
  }
  
  public func add(module: BXModule){
    if _modules.contains(where: { $0.isEqual(module) }) {
      NSLog("Ignore duplicate add module \(module)")
    }else{
      _modules.append(module)
    }
  }
  
  
}

extension BXModuleManager: UIApplicationDelegate{
  public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    NSLog("\(#function) \(application)  \(launchOptions)")
    for module in all(){
      module.application?(application, didFinishLaunchingWithOptions: launchOptions)
    }
    return true
  }
  
  public func applicationWillResignActive(_ application: UIApplication) {
    NSLog("\(#function) \(application) ")
    for module in all(){
      module.applicationWillResignActive?(application)
    }
  }
  
  public func applicationDidEnterBackground(_ application: UIApplication) {
    NSLog("\(#function) \(application) ")
    for module in all(){
      module.applicationDidEnterBackground?(application)
    }
  }
  
  public func applicationWillEnterForeground(_ application: UIApplication) {
    NSLog("\(#function) \(application) ")
    for module in all(){
      module.applicationWillEnterForeground?(application)
    }
  }
 
  public func applicationDidBecomeActive(_ application: UIApplication) {
    NSLog("\(#function) \(application) ")
    for module in all(){
      module.applicationDidBecomeActive?(application)
    }
  }
  
  public func applicationWillTerminate(_ application: UIApplication) {
    NSLog("\(application) willTerminate")
    for module in all(){
      module.applicationWillTerminate?(application)
    }
  }
}
