//
//  modelDetector.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import Foundation
import IOKit

// Getting the Device type (e.g. MacBook Pro)
func getMacType() -> String? {
    var systemInfo = [CChar](repeating: 0, count: 1024)
    var size = Int(systemInfo.count)
    let result = sysctlbyname("hw.model", &systemInfo, &size, nil, 0)
    guard result == 0 else { return nil }
    let model = String(cString: systemInfo).trimmingCharacters(in: .whitespacesAndNewlines)
    let modelComponents = model.components(separatedBy: CharacterSet.decimalDigits)
    let modelName = modelComponents[0].trimmingCharacters(in: .whitespacesAndNewlines)
    print(modelName)
    switch modelName {
    case "MacBookPro":
        return "MacBook Pro"
    case "iMac":
        return "iMac"
    case "Macmini":
        return "Mac Mini"
    case "MacBookAir":
        return "MacBook Air"
    case "MacBook":
        return "MacBook"
    case "MacPro":
        return "Mac Pro"
    default:
        return "Unknown"
    }
}

// Getting the name of the asset (image) based on device type
func getMacIconName(macType: String) -> String {
    switch macType {
    case "MacBook Pro":
        return "macbookpro"
    case "iMac":
        return "imac"
    case "Mac Mini":
        return "macmini"
    case "MacBook Air":
        return "macbookair"
    case "MacBook":
        return "macbook12"
    case "Mac Pro":
        return "macpro"
    default:
        return "icon-unknown"
    }
}
