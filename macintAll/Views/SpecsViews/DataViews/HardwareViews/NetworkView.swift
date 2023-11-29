//
//  NetworkView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

struct NetworkView: View {
    var body: some View {
        VStack{
            Image(systemName: "memorychip")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            List{
                HStack{
                    Text("Network name:")
                    Text(networkName!)
                    
                }.padding(.vertical, 2.0)
                
                HStack{
                    Text("Network type:")
                    Text(networkType!)
                    
                }.padding(.vertical, 2.0)
            }
        }
    }
}

#Preview {
    NetworkView()
}
