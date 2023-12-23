//
//  copyController.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 23.12.23.
//

import Foundation

let sonoma = "sudo /Applications/Install\\ macOS\\ Sonoma.app/Contents/Resources/createinstallmedia --volume /Volumes/USB"
let ventura = "sudo /Applications/Install\\ macOS\\ Ventura.app/Contents/Resources/createinstallmedia --volume /Volumes/USB"
let monterey = "sudo /Applications/Install\\ macOS\\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/USB"
let bigsur = "sudo /Applications/Install\\ macOS\\ Big\\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/USB"
let catalina = "sudo /Applications/Install\\ macOS\\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/USB"
let mojave = "sudo /Applications/Install\\ macOS\\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/USB"

func copyToClipboard(command: String) {
    let process = Process()
    process.launchPath = "/usr/bin/env"
    process.arguments = ["pbcopy"]
    
    let inputPipe = Pipe()
    process.standardInput = inputPipe
    
    let inputHandle = inputPipe.fileHandleForWriting
    inputHandle.write(command.data(using: .utf8)!)
    inputHandle.closeFile()
    
    process.launch()
    process.waitUntilExit()
    
    // Optionally, you can print a message to indicate that the text has been copied.
    print("Command copied to clipboard: \(command)")
}
