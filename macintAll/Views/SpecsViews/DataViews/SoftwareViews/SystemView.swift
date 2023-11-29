//
//  SystemView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

struct SystemView: View {
    var body: some View {
        VStack{
            Image(systemName: "command")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            List{
                HStack{
                    Text("Version: ")
                    Text(macOSVersion!)
                    
                }.padding(.vertical, 2.0)
            }
        }
    }
}

#Preview {
    SystemView()
}
