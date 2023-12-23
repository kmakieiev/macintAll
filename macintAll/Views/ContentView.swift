//
//  ContentView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 27.11.23.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ContentView: View {
    
    @State private var password: String = ""
    @State private var confirmation: String = ""
    
    var body: some View {
        ZStack{
            HStack{
                VStack{
                    Button{
                        showConfigureWindow()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.black)
                                .frame(width: 130, height: 130)
                            Image(systemName: "laptopcomputer")
                                .font(.system(size: 70))
                                .symbolRenderingMode(.monochrome)
                            Image(systemName: "gear")
                                .font(.system(size: 25))
                                .symbolRenderingMode(.monochrome)
                            Text("MODIFY")
                                .font(.system(size: 13))
                                .bold()
                                .offset(y: 45)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.white, lineWidth: 5)
                        )
                    }
                    .buttonStyle(GrowingButton())
                    
                    Button{
                        showCreateWindow()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.black)
                                .frame(width: 130, height: 130)
                            Image(systemName: "laptopcomputer.and.arrow.down")
                                .font(.system(size: 70))
                                .symbolRenderingMode(.monochrome)
                                .offset(y:-5)
                            Text("CREATE NEW")
                                .font(.system(size: 13))
                                .bold()
                                .offset(y: 45)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.white, lineWidth: 5)
                        )
                    }
                    .buttonStyle(GrowingButton())
                }
                Button{
                    showSpecsWindow()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.black)
                            .frame(width: 430, height: 300)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(.white, lineWidth: 5)
                            )
                        Image(getMacIconName(macType: getMacType()!))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 440, height: 370)
                    }
                }
                .buttonStyle(GrowingButton())
            }
        }
        .padding()
        .background(Color.black)
    }
}

#Preview {
    ContentView()
}
