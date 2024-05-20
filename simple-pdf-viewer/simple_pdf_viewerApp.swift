//
//  simple_pdf_viewerApp.swift
//  simple-pdf-viewer
//
//  Created by Syed Fasiuddin on 5/19/24.
//

import SwiftUI
import UniformTypeIdentifiers

@main
struct simple_pdf_viewerApp: App {
    @State var selectedFileURL: URL?

    var body: some Scene {
        WindowGroup {
            ContentView(selectedFileURL: selectedFileURL)
        }
        .commands {
            CommandGroup(after: CommandGroupPlacement.newItem) {
                Button("Open") {
                    self.selectedFileURL = self.getFileURLToOpen()
                }
                .keyboardShortcut("o", modifiers: [.command])
            }
        }
    }
    
    func getFileURLToOpen() -> URL? {
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = false
        panel.allowedContentTypes = [UTType.pdf].compactMap { $0 }
        return panel.runModal() == .OK ? panel.url : nil
    }
}
