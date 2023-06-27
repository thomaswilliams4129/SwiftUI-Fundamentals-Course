//
//  Alert.swift
//  Barcode-Scanner
//
//  Created by Thomas Williams on 6/26/23.
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
