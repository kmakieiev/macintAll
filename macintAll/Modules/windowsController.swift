//
//  windowsController.swift
//  macintAll
//
//  Created by Kyryl Makieiev on 29.11.23.
//

import Foundation
import SwiftUI

class ConfigureWindowController: NSWindowController {

    convenience init() {
        
        //Configuration of the main window (with specs)
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 600, height: 350),
            styleMask: [.titled, .closable, .miniaturizable, .fullSizeContentView],
            backing: .buffered, defer: false
        )
        
        let MainView = ConfigureView()
        
        self.init(window: window)
        
        window.contentView = NSHostingView(rootView: MainView)

    }

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.center()
        window?.makeKeyAndOrderFront(nil)
        
    }

}

class CreateWindowController: NSWindowController {

    convenience init() {
        
        //Configuration of the main window (with specs)
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 600, height: 350),
            styleMask: [.titled, .closable, .miniaturizable, .fullSizeContentView],
            backing: .buffered, defer: false
        )
        
        let MainView = CreateView()
        
        self.init(window: window)
        
        window.contentView = NSHostingView(rootView: MainView)

    }

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.center()
        window?.makeKeyAndOrderFront(nil)
        
    }

}

class SpecsWindowController: NSWindowController {

    convenience init() {
        
        //Configuration of the main window (with specs)
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 600, height: 350),
            styleMask: [.titled, .closable, .miniaturizable, .fullSizeContentView],
            backing: .buffered, defer: false
        )
        
        let MainView = SpecsView()
        
        //ToolBar fix (require when you need to open a new window using NSWindowController)
                        let toolbarObjects = NSHostingView(rootView: ToolBarObjects())
                        toolbarObjects.frame.size = toolbarObjects.fittingSize

                        let titlebarAccessory = NSTitlebarAccessoryViewController()
                        titlebarAccessory.view = toolbarObjects
        titlebarAccessory.layoutAttribute = .trailing
        
        self.init(window: window)
        
        window.contentView = NSHostingView(rootView: MainView)
        
        window.toolbar = NSToolbar()
        window.addTitlebarAccessoryViewController(titlebarAccessory)
    }

    override func windowDidLoad() {
        super.windowDidLoad()
        window?.center()
        window?.makeKeyAndOrderFront(nil)
        
    }

}

func showConfigureWindow() {
    let windowController = ConfigureWindowController()
    windowController.showWindow(nil)
    windowController.window?.center()
}

func showCreateWindow() {
    let windowController = ConfigureWindowController()
    windowController.showWindow(nil)
    windowController.window?.center()
}

func showSpecsWindow() {
    let windowController = SpecsWindowController()
    windowController.showWindow(nil)
    windowController.window?.center()
}
