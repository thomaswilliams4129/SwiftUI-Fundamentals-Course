//
//  BarcodeScannerView.swift
//  Barcode-Scanner
//
//  Created by Thomas Williams on 6/20/23.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                    .padding()
                
                ScannedResults(scannedResults: viewModel.statusText, textColor: viewModel.statusTextColor)
                
                
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
            
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
    var textColor: Color
    
    var body: some View {
        Text(scannedResults)
            .font(.largeTitle)
            .fontWeight(.bold  )
            .foregroundColor(textColor)
    }
}
