//
//  ArticleManager.swift
//  Pods
//
//  Created by Mitriuc Maria on 4/28/17.
//
//

import Foundation
import CoreData

class ViewController: UIViewController {

    var managedObjectContext
    let entityDescription = NSEntityDescription.entityForName("Customer", inManagedObjectContext: self.managedObjectContext)
  //  let articleManager = ArticleManager()
    
        override func viewDidLoad()
        {
//            newArticle that creates a new item and returns it.
//                • getAllArticles that returns all the stored items.
//                    • getArticles (withLang lang: String) that returns all items stored with
//            The given language.
//                • getArticles (containString str: String) that returns all stored items
//            Containing the string passed in parameter.
//            • removeArticle (article: article) that removes the article.
//            • save saves all changes.
            
            
//            let predicate = NSPredicate(format: "name == %@", "Колбаса «Молочная»")
//            fetchRequest.predicate = predicate
            
//            let predicate = NSPredicate(format: "content CONTAINS[cd] %@ AND price < %d", str, 500)
//            fetchRequest.predicate = predicate
            
            func newArticle(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
            {
                let entityDescription = NSEntityDescription.entityForName("Article", inManagedObjectContext: self.managedObjectContext)
                let managedObject = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
                let results = try self.managedObjectContext.executeFetchRequest(fetchRequest)
                for result in results as! [NSManagedObject] {
                    print("name - \(result.valueForKey("name")!)")
            }
           //withLang lang: String
           func getAllArticles(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
           {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
                    do {
                        let results = try self.managedObjectContext.executeFetchRequest(fetchRequest)
                        for result in results as! [NSManagedObject] {
                            print("name - \(result.valueForKey("name")!)")
                        }
                } catch {
                    print(error)
                }
                
                return true
                }
            }
            //lang: String
            func getArticles (application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
            {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
                do {
                    let results = try self.managedObjectContext.executeFetchRequest(fetchRequest)
                    for result in results as! [NSManagedObject] {
                        print("name - \(result.valueForKey("name")!)")
                    }
                } catch {
                    print(error)
                }
                
                //return true
                }
            }
            func removeArticle(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
            {
                
            }
    
            func saveContext(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
            {
                if managedObjectContext.hasChanges {
                    do {
                        try managedObjectContext.save()
                    } catch {
                        let nserror = error as NSError
                        NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                        abort()
                    }
                }
            }
            
}
