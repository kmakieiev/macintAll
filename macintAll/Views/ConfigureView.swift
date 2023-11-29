//
//  ConfigureView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

struct ConfigureView: View {
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
    ConfigureView()
}
