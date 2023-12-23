//
//  macosInstallerController.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 23.12.23.
//

import Foundation
import AppKit

func macosFolder() {
    let fileManager = FileManager.default
    let appFolderURL = URL(fileURLWithPath: Bundle.main.resourcePath ?? "")

    do {
        // Look for "macOS Downloads/publicrelease" folder in resources
        let publicReleaseFolderPath = appFolderURL
            .appendingPathComponent("macOS Downloads")
            .appendingPathComponent("publicrelease")

        // Check if "publicrelease" folder exists
        guard fileManager.fileExists(atPath: publicReleaseFolderPath.path) else {
            print("publicrelease folder not found.")
            return
        }

        // Open "publicrelease" folder in Finder
        NSWorkspace.shared.open(publicReleaseFolderPath)
        print("Opened publicrelease folder in Finder: \(publicReleaseFolderPath.path)")
    } catch {
        print("Error while searching for publicrelease folder: \(error.localizedDescription)")
    }
}

func findmacOSInstaller() -> String? {
    let fileManager = FileManager.default
    let appFolderURL = URL(fileURLWithPath: Bundle.main.resourcePath ?? "")
    var macosInstallerPath: String? = nil
    
    do {
        let contents = try fileManager.contentsOfDirectory(at: appFolderURL, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles])
        
        for fileURL in contents {
            if fileURL.lastPathComponent == "BuildmacOSInstallApp.command" {
                macosInstallerPath = fileURL.path
            }
            
            if macosInstallerPath != nil {
                // Both files have been found, no need to continue searching
                break
            }
        }
    } catch {
        print("Error while searching for files: \(error.localizedDescription)")
    }
    
    macOSInstallerPath = macosInstallerPath!
    
    return (macosInstallerPath)
}

func deleteMacOSDownloadsFolder() {
    let fileManager = FileManager.default
    let appFolderURL = URL(fileURLWithPath: Bundle.main.resourcePath ?? "")

    // Prepare the path to the "macOS Downloads" folder
    let macOSDownloadsFolderPath = appFolderURL.appendingPathComponent("macOS Downloads")

    // Check if "macOS Downloads" folder exists
    guard fileManager.fileExists(atPath: macOSDownloadsFolderPath.path) else {
        print("macOS Downloads folder not found.")
        return
    }

    // Ask for user confirmation using a dialog
    let alert = NSAlert()
    alert.messageText = "Delete macOS Downloads Folder"
    alert.informativeText = "Are you sure you want to delete the macOS Downloads folder? This action cannot be undone."
    alert.addButton(withTitle: "Delete")
    alert.addButton(withTitle: "Cancel")

    let response = alert.runModal()
    if response == .alertFirstButtonReturn {
        // User clicked "Delete" button
        do {
            // Delete the "macOS Downloads" folder
            try fileManager.removeItem(at: macOSDownloadsFolderPath)
            print("macOS Downloads folder deleted successfully.")
        } catch {
            print("Error while deleting macOS Downloads folder: \(error.localizedDescription)")
        }
    } else {
        // User clicked "Cancel" button or closed the dialog
        print("Deletion canceled by the user.")
    }
}
