//
//  NetworkErrors.swift
//  swiftUIApi
//
//  Created by Rodrigo Silva on 14/06/24.
//

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}
