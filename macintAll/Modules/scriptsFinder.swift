//
//  scriptsFinder.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import Foundation

var ramSpecsPath: String = ""
var ssdSpecsPath: String = ""

var python3Path: String = ""

// Returning the full path to script files (required for functions "getSSDInfo()" and "getRAMInfo()")
func findRequiredFiles() -> (ramspecsPath: String?, ssdspecsPath: String?) {
    let fileManager = FileManager.default
    let appFolderURL = URL(fileURLWithPath: Bundle.main.resourcePath ?? "")
    var ramspecsPath: String? = nil
    var ssdspecsPath: String? = nil
    
    do {
        let contents = try fileManager.contentsOfDirectory(at: appFolderURL, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles])
        
        for fileURL in contents {
            if fileURL.lastPathComponent == "ramspecs.py" {
                ramspecsPath = fileURL.path
            } else if fileURL.lastPathComponent == "ssdspecs.py" {
                ssdspecsPath = fileURL.path
            }
            
            if ramspecsPath != nil && ssdspecsPath != nil {
                // Both files have been found, no need to continue searching
                break
            }
        }
    } catch {
        print("Error while searching for files: \(error.localizedDescription)")
    }
    
    ramSpecsPath = ramspecsPath!
    ssdSpecsPath = ssdspecsPath!
    
    return (ramspecsPath, ssdspecsPath)
}

