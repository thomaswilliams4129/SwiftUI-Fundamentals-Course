//
//  BarcodeScannerView.swift
//  Barcode-Scanner
//
//  Created by Thomas Williams on 6/20/23.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {
        NavigationView {
            VStack {
                // empty scanner
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                    .padding()
                
                ScannedResults(scannedResults: "Not Yet Scanned", successFullScan: false)
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
    var successFullScan: Bool
    
    var body: some View {
        Text(scannedResults)
            .font(.largeTitle)
            .fontWeight(.bold  )
            .foregroundColor(successFullScan ? .green : .red)
    }
}
