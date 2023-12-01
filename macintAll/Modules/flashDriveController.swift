//
//  flashDriveController.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 01.12.23.
//

import Foundation

func copyEFI() {
    // Get the desktop directory
    let desktopURL = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first!

    // Get a list of mounted volumes
    if let volumes = FileManager.default.mountedVolumeURLs(includingResourceValuesForKeys: nil, options: .skipHiddenVolumes) {
        for volumeURL in volumes {
            // Check if the volume is an external drive
            if findED(volumeURL) {
                // Check if the EFI folder exists
                let efiURL = volumeURL.appendingPathComponent("EFI")
                if FileManager.default.fileExists(atPath: efiURL.path) {
                    // Copy the EFI folder to the desktop
                    do {
                        let destinationURL = desktopURL.appendingPathComponent("EFI")
                        try FileManager.default.copyItem(at: efiURL, to: destinationURL)
                        print("EFI folder copied to desktop successfully.")
                    } catch {
                        print("Error copying EFI folder: \(error.localizedDescription)")
                    }
                } else {
                    print("EFI folder not found on the external drive.")
                }
            }
        }
    }
}

func getEDName() -> String? {
    // Get a list of mounted volumes
    if let volumes = FileManager.default.mountedVolumeURLs(includingResourceValuesForKeys: nil, options: .skipHiddenVolumes) {
        for volumeURL in volumes {
            // Check if the volume is an external drive
            if findED(volumeURL) {
                // Check if the EFI folder exists
                let efiURL = volumeURL.appendingPathComponent("EFI")
                if FileManager.default.fileExists(atPath: efiURL.path) {
                    // Get the volume name
                    do {
                        let resourceValues = try volumeURL.resourceValues(forKeys: [.volumeLocalizedNameKey])
                        if let volumeName = resourceValues.volumeLocalizedName {
                            return volumeName
                        }
                    } catch {
                        print("Error getting volume name: \(error.localizedDescription)")
                    }
                }
            }
        }
    }

    // Return nil if no external drive with EFI folder is found
    return nil
}


// Helper function to check if a volume is an external drive
func findED(_ volumeURL: URL) -> Bool {
    var isExternal = false

    do {
        let resourceValues = try volumeURL.resourceValues(forKeys: [.volumeIsInternalKey])
        if let isInternal = resourceValues.volumeIsInternal {
            isExternal = !isInternal
        }
    } catch {
        print("Error checking if volume is internal: \(error.localizedDescription)")
    }

    return isExternal
}
