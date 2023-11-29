//
//  CPUView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

struct CPUView: View {
    var body: some View {
        
        VStack{
            Image(systemName: "cpu")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            List{
                HStack{
                    Text("Name:")
                    Text(cpuName)
                    
                }.padding(.vertical, 2.0)
                
                HStack{
                    Text("Total Cores: ")
                    Text(cpuCores)
                }.padding(.vertical, 2.0)
                
            }
        }
        
        
    }
}

#Preview {
    CPUView()
}
