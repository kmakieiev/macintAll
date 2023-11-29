//
//  GraphicView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

import SwiftUI

struct GraphicView: View {
    var body: some View {
        VStack{
            Image(systemName: "cube")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            List{
                HStack{
                    Text("Name: ")
                    Text(gpuName!)
                    
                }.padding(.vertical, 2.0)
                
                HStack{
                    Text("Memory size: ")
                    Text(gpuMemorySize!)
                }.padding(.vertical, 2.0)
                
            }
        }
    }
}


#Preview {
    GraphicView()
}
