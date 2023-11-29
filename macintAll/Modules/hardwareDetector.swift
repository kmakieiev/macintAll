//
//  hardwareDetector.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import Foundation
import Darwin
import IOKit
import Metal
import AppKit
import SystemConfiguration
import CoreWLAN


var modelID: String = ""

var cpuName: String = ""
var cpuCores: String = ""

var modulesAmount: String = ""
var totalRAMSize: String = ""
var ramSpeed: String = ""
var ramTechnology: String = ""

var gpuName: String?
var gpuMemorySize: String?

var storageName: String = ""
var storageCapacity: String = ""

var macOSVersion: String? = ""

var screenResolution: String? = ""

var networkName: String? = ""
var networkType: String? = ""

// Getting the CPU name (e.g Intel Core i5-1035G1)
func getCPUSpecs() {
    
    var size = 0
    
    sysctlbyname("machdep.cpu.brand_string", nil, &size, nil, 0)
    
    var value = [CChar](repeating: 0, count: size)
    
    sysctlbyname("machdep.cpu.brand_string", &value, &size, nil, 0)
    
    let processInfo = ProcessInfo()
    
    cpuName = String(cString: value)
    
    cpuCores = String(processInfo.processorCount)
    
}

// Getting the RAM information
func getRAMInfo() {
    let task = Process()
    task.launchPath = "/usr/bin/python3"
    task.arguments = [ramSpecsPath]
    task.currentDirectoryPath = Bundle.main.resourcePath!
    
    let pipe = Pipe()
    task.standardOutput = pipe
    
    let fileHandle = pipe.fileHandleForReading
    task.launch()
    
    let data = fileHandle.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)
    
    if let outputLines = output?.components(separatedBy: "\n") {
        modulesAmount = outputLines[0]
        totalRAMSize = outputLines[1]
        ramSpeed = outputLines[2]
        ramTechnology = outputLines[3]
    }
    return
}

// Getting the SSD information
func getSSDInfo() {
    
    let task = Process()
    task.launchPath = "/usr/bin/python3"
    task.arguments = [ssdSpecsPath]
    task.currentDirectoryPath = Bundle.main.resourcePath!
    
    let outputPipe = Pipe()
    task.standardOutput = outputPipe
    
    do {
        try task.run()
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: outputData, encoding: .utf8) ?? "Unknown"
        let outputLines = output.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: "\n")
        if outputLines.count >= 2 {
            storageName = outputLines[0]
            storageCapacity = outputLines[1]
        } else {
            print("Error: Output does not contain at least two lines")
        }
    } catch {
        print("Error running Python script: \(error.localizedDescription)")
    }
    
    return
}

// Getting the GPU information (e.g. "Intel Iris Plus Graphics" - 3072 MB )
func getGPUSpecs() {
    let device = MTLCreateSystemDefaultDevice()
    
    if let device = device {
        gpuName = device.name
        gpuMemorySize = "\(device.currentAllocatedSize / (1024*1024)) MB"
    } else {
        gpuName = nil
        gpuMemorySize = nil
    }
}

// Getting the MacOS information
func getMacOSVersion() {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = ["sw_vers", "-productVersion"]
    
    let pipe = Pipe()
    task.standardOutput = pipe
    
    task.launch()
    task.waitUntilExit()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines)
    
    macOSVersion = output
}

// Getting the Network information (Name and type)
func getNetworkInfo() {
    var type: String?
        let interfaces = SCNetworkInterfaceCopyAll() as NSArray
        for interface in interfaces {
            if let interfaceName = SCNetworkInterfaceGetBSDName(interface as! SCNetworkInterface),
               let interfaceType = SCNetworkInterfaceGetInterfaceType(interface as! SCNetworkInterface),
               let details = SCDynamicStoreCopyValue(nil, "State:/Network/Interface/\(interfaceName)/AirPort" as CFString) as? [String: Any] {
                type = interfaceType == kSCNetworkInterfaceTypeEthernet ? "Ethernet" : "Wi-Fi"
                break
            }
        }
    networkName = CWWiFiClient.shared().interface(withName: nil)?.ssid() ?? ""
    networkType = type
}


// Getting the Screen resolution
func getScreenResolution() {
    guard let screen = NSScreen.main else {
        screenResolution = "Screen resolution not available"
        return
    }
    
    let screenSizeInPoints = screen.frame.size
    let backingScaleFactor = screen.backingScaleFactor
    
    let scrRes = CGSize(width: screenSizeInPoints.width * backingScaleFactor, height: screenSizeInPoints.height * backingScaleFactor)
    
    screenResolution = String(format: "%.0fx%.0f pixels", scrRes.width, scrRes.height)
}






