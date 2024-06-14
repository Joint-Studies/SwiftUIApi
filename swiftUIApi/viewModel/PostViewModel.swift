//
//  PostViewModel.swift
//  swiftUIApi
//
//  Created by Rodrigo Silva on 14/06/24.
//

import Foundation

@MainActor class PostViewModel: ObservableObject{
    @Published var postData = [PostModel]()
    
    func fetchData() async {
        guard let data: [PostModel] = await ApiService().receiveDataFromApi(fromUrl: "https://jsonplaceholder.typicode.com/posts") else {return }
        
        postData = data
    }
}
