//
//  SavedPostsView.swift
//  swiftUIApi
//
//  Created by Rodrigo Silva on 01/07/24.
//

import SwiftUI

struct SavedPostsView: View {
    @FetchRequest(sortDescriptors: []) private var posts: FetchedResults<PostsEntity>
    
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) var viewContext

    var body: some View {
        List{
            ForEach(posts){post in
                CardViewEntity(post: post)
            }.onDelete(perform: delete)
            
        }
    }
    
    private func delete(at offsets: IndexSet) {
           for index in offsets {
               let post = posts[index]
               self.viewContext.delete(post)
               do {
                   try viewContext.save()
                   print("perform delete")
               } catch {
                   // handle the Core Data error
               }
           }
       }
}

#Preview {
    SavedPostsView()
}
