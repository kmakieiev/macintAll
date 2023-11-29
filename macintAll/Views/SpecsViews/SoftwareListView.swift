//
//  SoftwareListView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

struct SoftwareListView: View {
    var body: some View {
        VStack
        {
            NavigationView
            {
                List
                {
            
                    NavigationLink(destination: SystemView())
                    {
                        Image(systemName: "command")
                        Text("MacOS")
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

