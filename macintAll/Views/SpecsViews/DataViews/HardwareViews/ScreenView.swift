//
//  ScreenView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

struct ScreenView: View {
    var body: some View {
        Image(systemName: "display")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
        List{
            HStack{
                Text("Resolution: ")
                Text(screenResolution!)
                
            }.padding(.vertical, 2.0)
        }
    }
}

#Preview {
    ScreenView()
}
