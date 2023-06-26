//
//  BarcodeScannerView.swift
//  Barcode-Scanner
//
//  Created by Thomas Williams on 6/20/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input",
                                              message: "Something is wrong with the camera. We are unable to caputer the input.",
                                              dismissButton: .default(Text("OK")))
    
    static let invalidScannedType = AlertItem(title: "Invalid Scanned Type",
                                              message: "The value scanned is not valid. THis app scans EAN-8 and EAN-13.",
                                              dismissButton: .default(Text("OK")))
}

struct BarcodeScannerView: View {
    
    @State private var scannedCode = ""
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                    .padding()
                
                ScannedResults(scannedResults: scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode, successfullScan: scannedCode.isEmpty ? false : true)
                
                
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $alertItem) { alertItem in
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
    var successfullScan: Bool
    
    var body: some View {
        Text(scannedResults)
            .font(.largeTitle)
            .fontWeight(.bold  )
            .foregroundColor(successfullScan ? .green : .red)
    }
}
