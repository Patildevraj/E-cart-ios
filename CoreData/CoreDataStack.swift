//
//  CoreDataStack.swift
//  Feed Screen
//
//  Created by Kibbcom on 09/05/24.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ProductEntityModel")
        
        let description = NSPersistentStoreDescription()
        description.type = NSSQLiteStoreType
        container.persistentStoreDescriptions = [description]
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent store: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() throws {
        if context.hasChanges {
            try context.save()
        }
    }
    
    func createEntityDescription() -> NSEntityDescription {
        let entity = NSEntityDescription()
        entity.name = "ProductEntityModel"
        entity.managedObjectClassName = NSStringFromClass(ProductEntityModel.self)
        
        let idAttribute = NSAttributeDescription()
        idAttribute.name = "id"
        idAttribute.attributeType = .integer64AttributeType
//        idAttribute.isOptional = true
        
        let titleAttribute = NSAttributeDescription()
        titleAttribute.name = "title"
        titleAttribute.attributeType = .stringAttributeType
//        titleAttribute.isOptional = true
        
        let descriptionTextOfDescription = NSAttributeDescription()
        descriptionTextOfDescription.name = "descriptionText"
        descriptionTextOfDescription.attributeType = .stringAttributeType
//        descriptionAttribute.isOptional = true
        
        let priceAttribute = NSAttributeDescription()
        priceAttribute.name = "price"
        priceAttribute.attributeType = .integer64AttributeType
//        priceAttribute.isOptional = true
        
        let discountPercentageAttribute = NSAttributeDescription()
        discountPercentageAttribute.name = "discountPercentage"
        discountPercentageAttribute.attributeType = .doubleAttributeType
//        discountPercentageAttribute.isOptional = true
        
        let imagesAttribute = NSAttributeDescription()
        imagesAttribute.name = "imagesData"
        imagesAttribute.attributeType = .binaryDataAttributeType
//        imagesAttribute.isOptional = true
        
        entity.properties = [idAttribute, titleAttribute, descriptionTextOfDescription, priceAttribute, discountPercentageAttribute, imagesAttribute]
        
        return entity
    }
    
    func setupCoreDataModel() {
        let model = NSManagedObjectModel()
        model.entities = [createEntityDescription()]
        
        let container = NSPersistentContainer(name: "ProductEntityModel", managedObjectModel: model)
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent store: \(error)")
            }
        }
        
        persistentContainer = container
    }
}















//import CoreData
//
//class CoreDataStack{
//    static var sharedCD = CoreDataStack()
//    
//    lazy var persistentContainer: NSPersistentContainer = {
//            let container = NSPersistentContainer(name: "ProductEntityModel")
//            container.loadPersistentStores { description, error in
//                if let error = error {
//                    fatalError("Failed to load Core Data stack: \(error)")
////                    print("failed to load core data stack")
//                }
//                
//            }
//            return container
//        }()
//
//        var context: NSManagedObjectContext {
//            return persistentContainer.viewContext
//        }
//
//        private init() {}
//    
//    
//    func saveContext() {
//          let context = persistentContainer.viewContext
//          if context.hasChanges {
//              do {
//                  try context.save()
//              } catch {
//                  let nserror = error as NSError
//                  fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//              }
//          }
//      }
//}
//
