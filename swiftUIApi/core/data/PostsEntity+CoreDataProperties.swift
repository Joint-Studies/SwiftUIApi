//
//  PostsEntity+CoreDataProperties.swift
//  
//
//  Created by Rodrigo Silva on 01/07/24.
//
//

import Foundation
import CoreData


extension PostsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PostsEntity> {
        return NSFetchRequest<PostsEntity>(entityName: "PostsEntity")
    }

    @NSManaged public var user_id: Int32
    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var body: String?

}

extension Todo : Identifiable {

}
