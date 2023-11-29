//
//  RAMView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

struct RAMView: View {
    var body: some View {
        VStack{
            Image(systemName: "memorychip")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            List{
                HStack{
                    Text("Modules:")
                    Text(modulesAmount)
                }.padding(.vertical, 2.0)
                
                HStack{
                    Text("Size: ")
                    Text(totalRAMSize)
                }.padding(.vertical, 2.0)
                
                HStack{
                    Text("Speed: ")
                    Text(ramSpeed)
                }.padding(.vertical, 2.0)
                
                HStack{
                    Text("Generation: ")
                    Text(ramTechnology)
                }.padding(.vertical, 2.0)

            }
        }
    }
}

#Preview {
    RAMView()
}
