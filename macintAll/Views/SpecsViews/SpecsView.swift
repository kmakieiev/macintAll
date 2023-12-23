//
//  SpecsView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

struct SpecsView: View {
    
    @State var macType: String = ""
    
    var body: some View {
        HStack{
            NavigationView{
                List{
                    NavigationLink(destination: HardwareListView()){
                        HStack{
                            Image(systemName: "laptopcomputer")
                            Text("Hardware")
                                .font(.system(size: 16))
                        }
                        .padding(.vertical, 2.0)
                    }
                    NavigationLink(destination: SoftwareListView()){
                        HStack{
                            Image(systemName: "gear")
                            Text("Software")
                                .font(.system(size: 16))
                        }
                        .padding(.vertical, 2.0)
                    }
                    Text("Release 1.0")
                        .padding(.top, 170.0)
                }
                .padding(.top, 30.0)
                .listStyle(SidebarListStyle())
            }
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
        .onAppear(){
            
            let (ramspecsPath, ssdspecsPath, gibmac) = findRequiredFiles()
            
            if let ramspecsPath = ramspecsPath {
                print("Found ramspecs.py at path: \(ramspecsPath)")
            } else {
                print("Could not find ramspecs.py")
            }
            
            if let ssdspecsPath = ssdspecsPath {
                print("Found ssdspecs.py at path: \(ssdspecsPath)")
            } else {
                print("Could not find ssdspecs.py")
            }
            
            macType = getMacType()!
            
            getCPUSpecs()
            getRAMInfo()
            getSSDInfo()
            getGPUSpecs()
            getMacOSVersion()
            getScreenResolution()
            getNetworkInfo()
        }
    }
}

#Preview {
    SpecsView()
}
