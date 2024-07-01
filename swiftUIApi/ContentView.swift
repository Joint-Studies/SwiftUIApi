//
//  ContentView.swift
//  swiftUIApi
//
//  Created by Rodrigo Silva on 14/06/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var postVM = PostViewModel()
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) var viewContext
    @State private var showError: Bool = false
    
    @FetchRequest(sortDescriptors: []) private var postsEntity: FetchedResults<PostsEntity>

    
    
    
    
    var body: some View {
        List{
            ForEach(postVM.postData) { post in
                CardView(post: post){
                    if savePost(postModel: post) {
                        
                    } else {
                        showError = true
                    }
                }
                .alert(isPresented: $showError) {
                    Alert(title: Text("Error"), message: Text("Post already exists"), dismissButton: .default(Text("OK")))
                }
                
            }
            .listRowSeparator(.automatic)
            .listRowBackground(
                RoundedRectangle(cornerRadius: 5)
                    .background(.clear)
                    .foregroundColor(.white)
                    .padding(
                        EdgeInsets(
                            top: 2,
                            leading: 10,
                            bottom: 2,
                            trailing: 10
                        )
                    )
            )
        }
        .onAppear{
            if postVM.postData.isEmpty {
                Task {
                    await postVM.fetchData()
                }
            }
        }
    }
    
    func savePost(postModel: PostModel) -> Bool {
        
        // Verificar se o post já existe
        if postExists(title: postModel.title, body: postModel.body) {
            return false
        }
        
        let post = PostsEntity(context: self.viewContext)
        
        post.id = Int32(postModel.id)
        post.title = postModel.title
        post.body = postModel.body
        post.user_id = Int32(postModel.userId)
        
        do {
            try self.viewContext.save()
            print("Post saved!")
            return true
        } catch {
            fatalError("Failed to save post: \(error)")
        }
    }
    
    
    func postExists(title: String, body: String) -> Bool {
            let fetchRequest: NSFetchRequest<PostsEntity> = PostsEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "title == %@ AND body == %@", title, body)

            do {
                let count = try viewContext.count(for: fetchRequest)
                return count > 0
            } catch {
                fatalError("Failed to fetch posts: \(error)")
            }
        }
    
}

#Preview {
    ContentView()
}
