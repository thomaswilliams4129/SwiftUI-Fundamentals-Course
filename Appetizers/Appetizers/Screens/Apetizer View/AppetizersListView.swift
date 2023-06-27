//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by Thomas Williams on 6/27/23.
//

import SwiftUI

struct AppetizersListView: View {
    var body: some View {
        NavigationView {
            Text("Appetizers List View")
                .navigationTitle("🍟 Appetizers")
        }
    }
}

struct AppetizersListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListView()
    }
}
