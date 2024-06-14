import Foundation

protocol ApiServiceProtocol {
    func receiveDataFromApi<T: Codable>(fromUrl: String) async -> T?
}
