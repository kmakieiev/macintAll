//
//  StorageView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

struct StorageView: View {
    var body: some View {
        Image(systemName: "opticaldiscdrive")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
        List{
            HStack{
                Text("Volume name: ")
                Text(storageName)
                
            }.padding(.vertical, 2.0)
            
            HStack{
                Text("Capacity: ")
                Text(storageCapacity)
            }.padding(.vertical, 2.0)
        }
    }
    
}


#Preview {
    StorageView()
}
