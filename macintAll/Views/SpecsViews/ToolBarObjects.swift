//
//  ToolBarObjects.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

struct ToolBarObjects: View {
    var body: some View {
        HStack{
            Text("macAbout")
                .bold()
            
        }.padding(.horizontal, 20.0)
    }
}

struct ToolBarObjects_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarObjects()
    }
}
