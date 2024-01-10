//
//  CategoryHome.swift
//  Landmarks
//  Source: https://developer.apple.com/tutorials/swiftui/composing-complex-interfaces
//  Created by Joy Banerjee on 10/01/24.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        
        NavigationSplitView {
            List(content: {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
            })
                .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
        
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
