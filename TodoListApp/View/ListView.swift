//
//  ContentView.swift
//  TODOListFirstApp
//
//  Created by David Záruba on 16.03.2021.
//

import SwiftUI

struct ListView: View {
    var tasks: [Task] = testData
    
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
