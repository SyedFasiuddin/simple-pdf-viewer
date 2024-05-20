//
//  ContentView.swift
//  simple-pdf-viewer
//
//  Created by Syed Fasiuddin on 5/19/24.
//

import SwiftUI
import PDFKit
import UniformTypeIdentifiers
    
struct ContentView: View {
    @State var filename = ""
    @State var selectFileURL: URL?
    @State var previewURL: URL?
    
    var body: some View {
        VStack {
            if let url = selectFileURL {
                PDFKitView(url: url)
            } else {
                Button("Select File") {
                    let panel = NSOpenPanel()
                    panel.allowsMultipleSelection = false
                    panel.canChooseDirectories = false
                    panel.allowedContentTypes = [UTType.pdf].compactMap { $0 }
                    if panel.runModal() == .OK {
                        self.selectFileURL = panel.url
                        self.filename = panel.url?.lastPathComponent ?? "<none>"
                    }
                }
                .hidden()
                .keyboardShortcut("o", modifiers: [.command])
            }
        }
    }
}

struct PDFKitView: NSViewRepresentable {
    var url : URL
    func makeNSView(context: Context) -> PDFView {
        let pdfView = PDFView()
        
        pdfView.document = PDFDocument(url:url)
        pdfView.displaysPageBreaks = false
        pdfView.pageShadowsEnabled = false
        
        return pdfView
    }
    
    func updateNSView(_ nsView: PDFView, context: Context) {  }
}

#Preview {
    ContentView()
}
