//
//  ContentView.swift
//  Landmarks
//
//  Created by Joy Banerjee on 03/01/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tab: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    
    var body: some View {
        LandmarkList()
        
        TabView(selection: $tab) {
            CategoryHome()
                .tabItem({
                    Label("Featured", systemImage: "star")
                })
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem({
                    Label("List", systemImage: "list.bullet")
                })
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
