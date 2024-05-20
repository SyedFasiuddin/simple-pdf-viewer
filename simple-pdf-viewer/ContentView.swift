//
//  ContentView.swift
//  simple-pdf-viewer
//
//  Created by Syed Fasiuddin on 5/19/24.
//

import SwiftUI
import PDFKit
    
struct ContentView: View {
    var selectedFileURL: URL?
    
    var body: some View {
        VStack {
            if let url = selectedFileURL {
                PDFKitView(url: url)
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
