//
//  PostModel.swift
//  swiftUIApi
//
//  Created by Rodrigo Silva on 14/06/24.
//

import Foundation

struct PostModel: Identifiable , Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
//Identifiable is a protocol when you use a model list on SwiftUI
//Codable is a wraper of set procotols to allow a types in a JSON when decode is work.
