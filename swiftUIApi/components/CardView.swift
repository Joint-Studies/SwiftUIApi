//
//  CardView.swift
//  swiftUIApi
//
//  Created by Rodrigo Silva on 01/07/24.
//

import SwiftUI

struct CardView : View {
    
    let post: PostModel
    let onAdd: () -> Void
    
    var body : some View{
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
            Spacer()
            VStack{
                Image(systemName: "chevron.right")
                     .font(.caption)
                     .foregroundColor(.blue)
                Text("Swipe")
                    .font(.caption)
            }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: false){
            Button {
                onAdd()
               } label: {
                   Label("edit", systemImage: "pencil")
               }
               .tint(.blue)
        }
    }
}
