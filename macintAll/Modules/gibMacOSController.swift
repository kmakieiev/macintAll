//
//  gibMacOSController.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 16.12.23.
//

import Foundation

func terminal(withScriptPath scriptPath: String) {
    let command = "open -a Terminal \(scriptPath)"
    
    let process = Process()
    process.launchPath = "/bin/zsh" // You can use "/bin/bash" or another shell if needed
    process.arguments = ["-c", command]
    
    process.launch()
    process.waitUntilExit()
}
