//
//  CardView.swift
//  swiftUIApi
//
//  Created by Rodrigo Silva on 01/07/24.
//

import SwiftUI

struct CardViewEntity : View {
    
    let post: PostsEntity
    
    var body : some View{
        HStack{
            Text("\(post.user_id)")
                .padding()
                .overlay(Circle().stroke(.blue))
            VStack(
                alignment: .leading)
            {
                Text(post.title ?? "")
                    .bold()
                    .lineLimit(1)
                
                Text(post.body ?? "")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            Spacer()
            VStack{
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.blue)
                Text("Swipe")
                    .font(.caption)
            }
        }
    }
}

