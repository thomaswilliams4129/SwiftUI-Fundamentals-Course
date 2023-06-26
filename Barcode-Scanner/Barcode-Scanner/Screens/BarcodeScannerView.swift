//
//  BarcodeScannerView.swift
//  Barcode-Scanner
//
//  Created by Thomas Williams on 6/20/23.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @State private var scannedCode = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $scannedCode)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                    .padding()
                
                ScannedResults(scannedResults: scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode, successfullScan: scannedCode.isEmpty ? false : true)
            }
            .navigationTitle("Barcode Scanner")
        }
    }
}

struct BarcodeScannerView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}

struct ScannedResults: View {
    
    var scannedResults: String
    var successfullScan: Bool
    
    var body: some View {
        Text(scannedResults)
            .font(.largeTitle)
            .fontWeight(.bold  )
            .foregroundColor(successfullScan ? .green : .red)
    }
}
