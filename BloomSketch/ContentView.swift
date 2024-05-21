//
//  NewSprout_View.swift
//  BloomSketch
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var action: Int? = 1
    var body: some View {
        CustomNavigationLink(action: $action)
    }

}

#Preview {
    ContentView()
}
