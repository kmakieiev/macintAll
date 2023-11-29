//
//  HardwareListView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

struct HardwareListView: View {
    var body: some View {
        
        VStack
        {
            NavigationView
            {
                List
                {
            
                    NavigationLink(destination: CPUView())
                    {
                        Image(systemName: "cpu")
                        Text("CPU")
                            .font(.system(size: 16))
                            .padding(.vertical, 2.0)
                    }
                    
                    NavigationLink(destination: RAMView())
                    {
                        Image(systemName: "memorychip")
                        Text("RAM")
                            .font(.system(size: 16))
                            .padding(.vertical, 2.0)
                    }
                    
                    NavigationLink(destination: GraphicView())
                    {
                        Image(systemName: "cube")
                        Text("Graphic")
                            .font(.system(size: 16))
                            .padding(.vertical, 2.0)
                    }
                    
                    NavigationLink(destination: StorageView())
                    {
                        Image(systemName: "opticaldiscdrive")
                        Text("Storage")
                            .font(.system(size: 16))
                            .padding(.vertical, 2.0)
                    }
                    NavigationLink(destination: NetworkView())
                    {
                        Image(systemName: "network")
                        Text("Network")
                            .font(.system(size: 16))
                            .padding(.vertical, 2.0)
                    }
                    NavigationLink(destination: ScreenView())
                    {
                        Image(systemName: "display")
                        Text("Screen")
                            .font(.system(size: 16))
                            .padding(.vertical, 2.0)
                    }
                    
                    
                    Spacer()
                    
                }.frame(width:160)
                   // .listStyle(SidebarListStyle())
            }
        }
    }
}
