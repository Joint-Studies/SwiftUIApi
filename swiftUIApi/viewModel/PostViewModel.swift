//
//  PostViewModel.swift
//  swiftUIApi
//
//  Created by Rodrigo Silva on 14/06/24.
//

import Foundation

@MainActor class PostViewModel: ObservableObject{
    @Published var postData = [PostModel]()
    
    private let apiService: ApiServiceProtocol
    
    init(apiService: ApiServiceProtocol = ApiService()) {
            self.apiService = apiService
        }
    
    func fetchData() async {
        guard let data: [PostModel] = await apiService.receiveDataFromApi(fromUrl: "https://jsonplaceholder.typicode.com/posts") else {return }
        
        postData = data
    }
}
