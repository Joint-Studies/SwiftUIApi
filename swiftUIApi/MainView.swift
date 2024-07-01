//
//  MainView.swift
//  swiftUIApi
//
//  Created by Rodrigo Silva on 01/07/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView().tabItem{
                Label("Posts", systemImage: "house")
            }
            
            SavedPostsView().tabItem{
                Label("Saved", systemImage: "star")
            }
            
        }
    }
}

#Preview {
    MainView()
}
