//
//  ApiService.swift
//  swiftUIApi
//
//  Created by Rodrigo Silva on 14/06/24.
//

import Foundation

class ApiService {
    func receiveDataFromApi<T:Codable>(fromUrl: String) async -> T? {
        do {
            //Verify if is a valid url
            guard let url = URL(string: fromUrl) else { throw NetworkError.badUrl}
            //Connect to API
            let (data, response ) = try await URLSession.shared.data(from: url)
            //Verify if response has a valid response
            guard let response = response as? HTTPURLResponse else {throw NetworkError.badResponse}
            //Valid if is a success response
            guard response.statusCode >= 200 && response.statusCode < 300 else {throw NetworkError.badStatus}
            //Convert a response json to a Object(class)
            guard let decodedResponse  = try? JSONDecoder().decode(T.self, from: data) else {throw NetworkError.failedToDecodeResponse}
            
            return decodedResponse
            //These catch can convert in a error to user if needed
        }  catch NetworkError.badUrl {
            print("There was an error creating the URL")
        } catch NetworkError.badResponse {
            print("Did not get a valid response")
        } catch NetworkError.badStatus {
            print("Did not get a 2xx status code from the response")
        } catch NetworkError.failedToDecodeResponse {
            print("Failed to decode response into the given type")
        } catch {
            print("An error occured downloading the data")
        }
        return nil
    }
}
