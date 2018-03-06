//
//  CoreDataHandler.swift
//  CoreData_1
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit
import CoreData


class CoreDataHandler: NSObject {

    
    private class func getContext() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        return appDelegate.persistentContainer.viewContext
    }

   class func saveObject(username:String,password:String)-> Bool {
        
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let manageObject = NSManagedObject(entity:entity!,insertInto:context)
    
        manageObject.setValue(username, forKey: "username")
        manageObject.setValue(password, forKey: "password")
    
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
    
    
    class func fetchObject() -> [User]? {
        let context = getContext()
        var user:[User]? = nil
        do {
            user = try context.fetch(User.fetchRequest())
            return user
        } catch {
            return user
        }
        
    }
    
   class  func deleteObject(user:User) -> Bool {
        let context = getContext()
    
        context.delete(user)
    
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }

    
    class func cleanDelete() -> Bool {
        
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: User.fetchRequest())
        
        do {
            try context.execute(delete)
            return true
        } catch {
            return false
        }
    }
    
    class func filterData() -> [User]? {
        let context = getContext()
        let fetchRequest:NSFetchRequest<User> = User.fetchRequest()
        var user:[User]? = nil
        
        let predicate = NSPredicate(format:"username contains[c] %@","Yash")
        fetchRequest.predicate = predicate
        
        do {
            user = try context.fetch(fetchRequest)
            return user
        } catch {
            return user
        }
        
        
        
    }
    
    
    
}
