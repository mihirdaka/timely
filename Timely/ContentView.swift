//
//  ContentView.swift
//  Timely
//
//  Created by Mihir Daka on 6/27/25.
//

import SwiftUI

struct ContentView: View {
    let title: String
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView(title: "none")
}
