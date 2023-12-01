//
//  ConfigureView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

struct ConfigureView: View {
    
    @State private var latestVersion: String = "X.X.X"
    
    var body: some View {
        ZStack{
            Text("Hackintosh modification")
                .font(.system(size: 25))
                .bold()
                .offset(y: -210.0)
            VStack{
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.black)
                            .frame(width: 150, height: 150)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(.white, lineWidth: 5)
                            )
                        VStack{
                            Text("EFI: \(findEfi())")
                                .font(.system(size: 12))
                                .bold()
                                .offset(y: 32.0)
                            Button{
                                mountPartition(partitionID: findEfi())
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.black)
                                        .frame(width: 110, height: 40)
                                    Text("MOUNT")
                                        .font(.system(size: 12))
                                        .bold()
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 3)
                                )
                            }
                            .buttonStyle(GrowingButton())
                            .offset(y: 19.0)
                            
                            Button{
                                unmountPartition(partitionID: findEfi())
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.black)
                                        .frame(width: 110, height: 40)
                                    Text("UNMOUNT")
                                        .font(.system(size: 12))
                                        .bold()
                                    
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 3)
                                )
                            }
                            .buttonStyle(GrowingButton())
                            .offset(y: -16.0)
                        }
                    }
                    .padding(.trailing, 20)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.black)
                            .frame(width: 150, height: 150)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(.white, lineWidth: 5)
                            )
                        
                        VStack{
                            Text("EXPORT EFI")
                                .font(.system(size: 12))
                                .bold()
                                .offset(y: 15)
                            
                            Button{
                                copyEFI()
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(.black)
                                        .frame(width: 110, height: 90)
                                    Image(systemName: "externaldrive.badge.plus")
                                        .font(.system(size: 55))
                                        .symbolRenderingMode(.monochrome)
                                        .offset(y:-5)
                                    Text(getEDName()!)
                                        .font(.system(size: 12))
                                        .bold()
                                        .offset(y: 30)
                                    
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(.white, lineWidth: 3)
                                )
                            }
                            .buttonStyle(GrowingButton())
                        }
                    }
                }
                .offset(y:17)
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.black)
                        .frame(width: 327, height: 150)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.white, lineWidth: 5)
                        )
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.black)
                                .frame(width: 145, height: 125)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 3)
                                )
                            
                            VStack{
                                Text("LATEST OC VERSION")
                                    .font(.system(size: 12))
                                    .bold()
                                    .offset(y: 22)
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.white)
                                    .frame(width: 55, height: 15)
                                    .offset(y: 25)
                                Text(latestVersion)
                                    .foregroundStyle(.black)
                                    .bold()
                                    .offset(y: 2)
                                Button{
                                    getLatestVersion { version in
                                        // Update the UI on the main thread
                                        DispatchQueue.main.async {
                                            latestVersion = version ?? "Not Available"
                                        }
                                    }
                                } label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(.black)
                                            .frame(width: 120, height: 40)
                                        Text("CHECK VERSION")
                                            .font(.system(size: 12))
                                            .bold()
                                    }
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.white, lineWidth: 3)
                                    )
                                }
                                .buttonStyle(GrowingButton())
                                .offset(y: -7.0)
                                
                            }
                        }
                        .padding(.leading, 25)
                        VStack{
                            Button{
                                ocDownloader()
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.black)
                                        .frame(width: 140, height: 60)
                                    Text("DOWNLOAD OC")
                                        .font(.system(size: 12))
                                        .bold()
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 3)
                                )
                            }
                            .buttonStyle(GrowingButton())
                            .offset(y: 18.0)
                            
                            Button{
                                unmountPartition(partitionID: findEfi())
                            } label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.black)
                                        .frame(width: 140, height: 60)
                                    Text("UPDATE OC")
                                        .font(.system(size: 12))
                                        .bold()
                                    
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.white, lineWidth: 3)
                                )
                            }
                            .buttonStyle(GrowingButton())
                            .offset(y: -16.0)
                        }
                        .offset(x:-10)
                    }
                }
            }
        }
        .padding(.top, 70)
        .frame(width: 400, height: 450)
        .background(Color.black)
        
    }
}

#Preview {
    ConfigureView()
}
