//
//  CreateView.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import SwiftUI

struct CreateView: View {
    
    @State private var latestVersion: String = "X.X.X"
    
    var body: some View {
        VStack{
            Text("Hackintosh creating")
                .font(.system(size: 25))
                .bold()
                .offset(y: 35.0)
                .padding()
            HStack{
                VStack{
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
                                    .frame(width: 165, height: 125)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.white, lineWidth: 3)
                                    )
                                
                                VStack{
                                    Image(systemName: "arrow.down.to.line")
                                        .font(.system(size: 45))
                                        .symbolRenderingMode(.monochrome)
                                        .offset(y: 15.0)
                                    
                                    Button{
                                        terminal(withScriptPath: gibMacOSPath)
                                    } label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(.black)
                                                .frame(width: 140, height: 40)
                                            Text("DOWNLOAD MACOS")
                                                .font(.system(size: 12))
                                                .bold()
                                        }
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.white, lineWidth: 3)
                                        )
                                    }
                                    .buttonStyle(GrowingButton())
                                    
                                }
                            }
                            .padding(.leading, 25)
                            VStack{
                                ZStack{
                                    Button{
                                        deleteMacOSDownloadsFolder()
                                    } label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(.black)
                                                .frame(width: 55, height: 60)
                                            Image(systemName: "trash")
                                                .font(.system(size: 30))
                                                .symbolRenderingMode(.monochrome)
                                        }
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.white, lineWidth: 3)
                                        )
                                    }
                                    .buttonStyle(GrowingButton())
                                    .offset(x: 31.0, y: 18.0)
                                    Button{
                                        macosFolder()
                                    } label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(.black)
                                                .frame(width: 55, height: 60)
                                            Image(systemName: "folder")
                                                .font(.system(size: 30))
                                                .symbolRenderingMode(.monochrome)
                                            
                                        }
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.white, lineWidth: 3)
                                        )
                                    }
                                    .buttonStyle(GrowingButton())
                                    .offset(x: -31.0, y: 18.0)
                                }
                                
                                Button{
                                    terminal(withScriptPath: macOSInstallerPath)
                                } label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(.black)
                                            .frame(width: 120, height: 60)
                                        Text("INSTALLER")
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
                    .offset(y: -25.0)
                }
                .onAppear(){
                    let (ramspecsPath, ssdspecsPath, gibmacosPath) = findRequiredFiles()
                    let macOSInstallerPath = findmacOSInstaller()
                    
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.black)
                        .frame(width: 187, height: 323)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(.white, lineWidth: 5)
                        )
                        .offset(x: -2.0, y: -12.0)
                    
                    VStack{
                        
                        VStack{
                            Text("TERMINAL COMMANDS")
                                .font(.system(size: 12))
                                .bold()
                            Text("(press to copy)")
                                .font(.system(size: 10))
                        }
                        .offset(y: 75.0)
                        
                        Button{
                            copyToClipboard(command: sonoma)
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.black)
                                    .frame(width: 170, height: 30)
                                Text("SONOMA INSTALL")
                                    .font(.system(size: 12))
                                    .bold()
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.white, lineWidth: 3)
                            )
                        }
                        .buttonStyle(GrowingButton())
                        .offset(y: 70.0)
                        
                        Button{
                            copyToClipboard(command: ventura)
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.black)
                                    .frame(width: 170, height: 30)
                                Text("VENTURA INSTALL")
                                    .font(.system(size: 12))
                                    .bold()
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.white, lineWidth: 3)
                            )
                        }
                        .buttonStyle(GrowingButton())
                        .offset(y: 40.0)
                        
                        Button{
                            copyToClipboard(command: monterey)
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.black)
                                    .frame(width: 170, height: 30)
                                Text("MONTEREY INSTALL")
                                    .font(.system(size: 12))
                                    .bold()
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.white, lineWidth: 3)
                            )
                        }
                        .buttonStyle(GrowingButton())
                        .offset(y: 10.0)
                        
                        Button{
                            copyToClipboard(command: bigsur)
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.black)
                                    .frame(width: 170, height: 30)
                                Text("BIG SUR INSTALL")
                                    .font(.system(size: 12))
                                    .bold()
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.white, lineWidth: 3)
                            )
                        }
                        .buttonStyle(GrowingButton())
                        .offset(y: -20.0)
                        
                        Button{
                            copyToClipboard(command: catalina)
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.black)
                                    .frame(width: 170, height: 30)
                                Text("CATALINA INSTALL")
                                    .font(.system(size: 12))
                                    .bold()
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.white, lineWidth: 3)
                            )
                        }
                        .buttonStyle(GrowingButton())
                        .offset(y: -50.0)
                        
                        Button{
                            terminal(withScriptPath: mojave)
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.black)
                                    .frame(width: 170, height: 30)
                                Text("MOJAVE INSTALL")
                                    .font(.system(size: 12))
                                    .bold()
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.white, lineWidth: 3)
                            )
                        }
                        .buttonStyle(GrowingButton())
                        .offset(y: -80.0)
                        
                        
                    }
                }
                .offset(x: -5.0)
            }
        }
        .background(Color.black)
    }
}


#Preview {
    CreateView()
}
