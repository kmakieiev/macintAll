//
//  efiController.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 27.11.23.
//

import Foundation

func findEfi() -> String {
    let task = Process()
    let pipe = Pipe()
    
    task.launchPath = "/usr/sbin/diskutil"
    task.arguments = ["list", "-plist"]
    task.standardOutput = pipe
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    
    if let output = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any],
       let disks = output["AllDisksAndPartitions"] as? [[String: Any]] {
        
        var efiPartitionIdentifiers = ""
        
        for disk in disks {
            if let partitions = disk["Partitions"] as? [[String: Any]] {
                for partition in partitions {
                    if let deviceIdentifier = partition["DeviceIdentifier"] as? String,
                       let volumeContent = partition["Content"] as? String,
                       volumeContent == "EFI" {
                        efiPartitionIdentifiers += "\(deviceIdentifier)\n"
                    }
                }
            }
        }
        
        return efiPartitionIdentifiers
    }
    
    return "Error retrieving partition information."
}

func mountPartition(partitionID: String) {
    // Construct the path to the mount point
    let mountPoint = FileManager.default.temporaryDirectory.appendingPathComponent(partitionID)
    
    // Create FileManager
    let fileManager = FileManager.default
    
    // Check if the mount point already exists
    if !fileManager.fileExists(atPath: mountPoint.path) {
        // Create the mount point directory
        do {
            try fileManager.createDirectory(at: mountPoint, withIntermediateDirectories: false, attributes: nil)
        } catch {
            print("Error creating mount point directory: \(error)")
            return
        }
    }
    
    // Mount the partition using osascript to handle password input
    let mountCommand = "diskutil mount \(partitionID)"
    let osascriptCommand = "do shell script \"\(mountCommand)\" with administrator privileges"
    
    let osascriptProcess = Process()
    osascriptProcess.launchPath = "/usr/bin/osascript"
    osascriptProcess.arguments = ["-e", osascriptCommand]
    
    osascriptProcess.launch()
    osascriptProcess.waitUntilExit()
    
}

func unmountPartition(partitionID: String) {
    // Construct the path to the mount point
    let unmountPoint = FileManager.default.temporaryDirectory.appendingPathComponent(partitionID)
    
    // Create FileManager
    let fileManager = FileManager.default
    
    // Check if the mount point already exists
    if !fileManager.fileExists(atPath: unmountPoint.path) {
        // Create the mount point directory
        do {
            try fileManager.createDirectory(at: unmountPoint, withIntermediateDirectories: false, attributes: nil)
        } catch {
            print("Error creating mount point directory: \(error)")
            return
        }
    }
    
    // Mount the partition using osascript to handle password input
    let unmountCommand = "diskutil unmount \(partitionID)"
    let osascriptCommand = "do shell script \"\(unmountCommand)\" with administrator privileges"
    
    let osascriptProcess = Process()
    osascriptProcess.launchPath = "/usr/bin/osascript"
    osascriptProcess.arguments = ["-e", osascriptCommand]
    
    osascriptProcess.launch()
    osascriptProcess.waitUntilExit()
}



func unmountEFI(volumeID: String) {
    let task = Process()
    task.launchPath = "/usr/sbin/diskutil"
    task.arguments = ["sudo", "unmount", volumeID]
    
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    
    task.waitUntilExit()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    if let output = String(data: data, encoding: .utf8) {
        print("Output: \(output)")
    }
}

