//
//  ContentView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 27.11.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var password: String = ""
    @State private var confirmation: String = ""
    
    var body: some View {
        ZStack{
            VStack{
                Text("EFI Partition: \(findEfi())")
                
                HStack{
                    Button("Mount") {
                        mountPartition(partitionID: findEfi())
                    }
                    Button("Unmount") {
                        unmountPartition(partitionID: findEfi())
                    }
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
