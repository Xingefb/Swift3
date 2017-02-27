//
//  FileHeader.swift
//  Test
//
//  Created by Dzy on 24/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

import Foundation

import XCGLogger
/* can use
 
 log.verbose("一条verbose级别消息：程序执行时最详细的信息。")
 log.debug("一条debug级别消息：用于代码调试。")
 log.info("一条info级别消息：常用与用户在console.app中查看。")
 log.warning("一条warning级别消息：警告消息，表示一个可能的错误。")
 log.error("一条error级别消息：表示产生了一个可恢复的错误，用于告知发生了什么事情。")
 log.severe("一条severe error级别消息：表示产生了一个严重错误。程序可能很快会奔溃。")
 
 */
let log: XCGLogger = {
    
    // Create a logger object with no destinations
    let log = XCGLogger(identifier: "advancedLogger", includeDefaultDestinations: false)
    
    // Create a destination for the system console log (via NSLog)
    let systemDestination = AppleSystemLogDestination(identifier: "advancedLogger.systemDestination")
    
    // Optionally set some configuration options
    systemDestination.outputLevel = .debug
    systemDestination.showLogIdentifier = false
    systemDestination.showFunctionName = true
    systemDestination.showThreadName = false
    systemDestination.showLevel = true
    systemDestination.showFileName = true
    systemDestination.showLineNumber = true
    systemDestination.showDate = true
    
    // Add the destination to the logger
    log.add(destination: systemDestination)
    
    let cacheDirectory: URL = {
        let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return urls[urls.endIndex - 1] as URL
    }()
    
    let logPath: URL = cacheDirectory.appendingPathComponent("app.log")
    
    // Create a file log destination
    let fileDestination = FileDestination(writeToFile: logPath, identifier: "advancedLogger.fileDestination")
    
    // Optionally set some configuration options
    fileDestination.outputLevel = .debug
    fileDestination.showLogIdentifier = false
    fileDestination.showFunctionName = true
    fileDestination.showThreadName = true
    fileDestination.showLevel = true
    fileDestination.showFileName = true
    fileDestination.showLineNumber = true
    fileDestination.showDate = true
    // Process this destination in the background
    fileDestination.logQueue = XCGLogger.logQueue
    
    // Add the destination to the logger
    log.add(destination: fileDestination)
    
    // Add basic app info, version info etc, to the start of the logs
    log.logAppDetails()
    // Customize as needed
    
    return log
}()


