//
//  ocDownloader.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 01.12.23.
//

import Foundation
import Zip

import Foundation

func ocDownloader() {
    // Specify the repository and owner
    let repository = "OpenCorePkg"
    let owner = "acidanthera"

    // Create the GitHub API URL for releases
    let apiUrl = "https://api.github.com/repos/\(owner)/\(repository)/releases/latest"

    // Create a URL object
    if let url = URL(string: apiUrl) {
        // Create a URLSession
        let session = URLSession(configuration: .default)

        // Create a data task to fetch the latest release information
        let task = session.dataTask(with: url) { (data, response, error) in
            // Check for errors
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            // Check if data is available
            guard let data = data else {
                print("No data received.")
                return
            }

            do {
                // Parse the JSON response
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let jsonDict = json as? [String: Any],
                   let tagName = jsonDict["tag_name"] as? String,
                   let assets = jsonDict["assets"] as? [[String: Any]] {
                    
                    // Create the archive name based on the latest version
                    let archiveName = "OpenCore-\(tagName)-RELEASE.zip"

                    // Find the asset with the desired name
                    if let asset = assets.first(where: { ($0["name"] as? String) == archiveName }),
                       let downloadUrlString = asset["browser_download_url"] as? String,
                       let downloadUrl = URL(string: downloadUrlString) {
                        
                        // Download and save the zip file
                        downloadAndUnzip(zipUrl: downloadUrl)
                    } else {
                        print("Error: Asset not found or URL parsing issue.")
                    }
                } else {
                    print("Error parsing JSON.")
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }

        // Resume the data task
        task.resume()
    }
}

func downloadAndUnzip(zipUrl: URL?) {
    guard let zipUrl = zipUrl else {
        print("Invalid URL for zip file.")
        return
    }

    // Create a destination URL for the downloaded zip file on the desktop
    let desktopURL = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first!
    let destinationUrl = desktopURL.appendingPathComponent("OC_Archive.zip")

    // Download the zip file
    if let data = try? Data(contentsOf: zipUrl),
       ((try? data.write(to: destinationUrl)) != nil) {

        // Unzip the downloaded file
        do {
            // Create a subdirectory on the desktop
            let unzipDirectory = desktopURL.appendingPathComponent("OpenCore")

            try FileManager.default.createDirectory(at: unzipDirectory, withIntermediateDirectories: true, attributes: nil)

            try Zip.unzipFile(destinationUrl, destination: unzipDirectory, overwrite: true, password: nil)
            
            // Print success message
            print("Download and unzip successful. Extracted to: \(unzipDirectory.path)")
        } catch {
            print("Error unzipping file: \(error.localizedDescription)")
        }
    } else {
        print("Error downloading file.")
    }
}

func getLatestVersion(completion: @escaping (String?) -> Void) {
    // Specify the repository and owner
    let repository = "OpenCorePkg"
    let owner = "acidanthera"

    // Create the GitHub API URL for releases
    let apiUrl = "https://api.github.com/repos/\(owner)/\(repository)/releases/latest"

    // Create a URL object
    if let url = URL(string: apiUrl) {
        // Create a URLSession
        let session = URLSession(configuration: .default)

        // Create a data task to fetch the latest release information
        let task = session.dataTask(with: url) { (data, response, error) in
            // Check for errors
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }

            // Check if data is available
            guard let data = data else {
                print("No data received.")
                completion(nil)
                return
            }

            do {
                // Parse the JSON response
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let jsonDict = json as? [String: Any],
                   let tagName = jsonDict["tag_name"] as? String {
                    
                    // Completion with the latest version
                    completion(tagName)
                } else {
                    print("Error parsing JSON.")
                    completion(nil)
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }

        // Resume the data task
        task.resume()
    }
}








