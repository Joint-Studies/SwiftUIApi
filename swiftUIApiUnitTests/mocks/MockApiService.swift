//
//  MockApiService.swift
//  swiftUIApiUnitTests
//
//  Created by Rodrigo Silva on 14/06/24.
//

import Foundation

class MockApiService: ApiServiceProtocol {
    func receiveDataFromApi<T>(fromUrl: String) async -> T? {
        let mockData = [
            PostModel(userId: 1, id: 1, title: "Mock Title 1", body: "Mock Body 1"),
            PostModel(userId: 2, id: 2, title: "Mock Title 2", body: "Mock Body 2")
        ]
        return mockData as? T
    }
}
