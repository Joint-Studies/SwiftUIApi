//
//  PostsEntity.swift
//  
//
//  Created by Rodrigo Silva on 01/07/24.
//
//

import Foundation
import SwiftData


@Model public class PostsEntity {
    var user_id: Int64? = 0
    var id: Int64? = 0
    var title: String?
    var body: String?
    public init() {

    }
    
}
