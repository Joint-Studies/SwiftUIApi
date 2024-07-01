import CoreData
import Foundation

// Main data manager to handle the todo items
class DataManager: NSObject, ObservableObject {
    
    @Published var posts: [PostsEntity] = [PostsEntity]()

    
    // Add the Core Data container with the model name
    let container: NSPersistentContainer = NSPersistentContainer(name: "PostsDB")
    
    // Default init method. Load the Core Data container
    override init() {
        super.init()
        container.loadPersistentStores { _, _ in }
    }
}
