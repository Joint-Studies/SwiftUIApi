//
//  ContentView.swift
//  swiftUIApi
//
//  Created by Rodrigo Silva on 14/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var postVM = PostViewModel()
    
    var body: some View {
        List(postVM.postData){ post in
            HStack{
                Text("\(post.userId)")
                    .padding()
                    .overlay(Circle().stroke(.blue))
                VStack(
                    alignment: .leading,
                    content: {
                    Text(post.title)
                        .bold()
                        .lineLimit(1)
                    
                    Text(post.body)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                })
            }
        }
        .onAppear{
            if postVM.postData.isEmpty {
                Task {
                    await postVM.fetchData()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
