//
//  ArticleManager.swift
//  Pods
//
//  Created by Mitriuc Maria on 4/28/17.
//
//

import Foundation
import CoreData

//class ViewController: UIViewController
//{
//    let appDelegate = NSApplication.shared().delegate as! AppDelegate
//    let managedObjectContext = appDelegate.managedObjectContext
//   // var managedObjectContext
//    
//    let article = NSEntityDescription.insertNewObjectForEntityForName("Article", inManagedObjectContext: managedObjectContext) as! Article
//
//   // let article = NSEntityDescription.entityForName("Article", inManagedObjectContext: self.managedObjectContext)
//  //  let articleManager = ArticleManager()
//    
//        override func viewDidLoad()
//        {
//            
//            //let firstName = "Trevor"
//           // fetchRequest.predicate = NSPredicate(format: "firstName == %@", firstName)
//            
//            func newArticle(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
//            {
//                let entityDescription = NSEntityDescription.entityForName("Article", inManagedObjectContext: self.managedObjectContext)
//                let managedObject = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: self.managedObjectContext)
//                
//                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
//                let results = try self.managedObjectContext.executeFetchRequest(fetchRequest)
//                for result in results as! [NSManagedObject] {
//                    print("name - \(result.valueForKey("name")!)")
//            }
//                
//           //withLang lang: String
//           func getAllArticles(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
//           {
//                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
//                    do {
//                        let results = try self.managedObjectContext.executeFetchRequest(fetchRequest)
//                        for result in results as! [NSManagedObject] {
//                            print("name - \(result.valueForKey("name")!)")
//                        }
//                } catch {
//                    print(error)
//                }
//                
//                return true
//                }
//            }
//            
//            
//            //lang: String
//            func getArticles (application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
//            {
//                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Customer")
//                do {
//                    let results = try self.managedObjectContext.executeFetchRequest(fetchRequest)
//                    for result in results as! [NSManagedObject] {
//                        print("name - \(result.valueForKey("name")!)")
//                    }
//                } catch {
//                    print(error)
//                }
//                
//                //return true
//                }
//            }
//    
//    
//            func removeArticle(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
//            {
//                
//            }
//    
//    
//    //function to save my data
//            func saveContext(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
//            {
//                if managedObjectContext.hasChanges {
//                    do {
//                        try managedObjectContext.save()
//                    } catch {
//                        let nserror = error as NSError
//                        NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
//                        abort()
//                    }
//                }
//            }
//            
//}
public class ArticleManager
{
    public var managedObjectContext: NSManagedObjectContext
    
    var bundle: Bundle;
    var mom :NSManagedObjectModel
    
    public init()
    {
        bundle = Bundle(for: Article.self)
        let url = bundle.url(forResource: "Model", withExtension: "momd")!
        mom = NSManagedObjectModel(contentsOf: url)!
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        managedObjectContext = NSManagedObjectContext(concurrencyType:.mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex-1]
        let storeURL = docURL.appendingPathComponent("Model.xcdatamodeld")
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            print("Error migrating store: \(error)")
        }
        
    }
    
    public func newArticle(_ title:String, _ content:String,_ lang:String?,_ image:NSData?,_ atCreate:NSDate?, _ atModefied : NSDate? ) -> Article
    {
        let entity = NSEntityDescription.entity(forEntityName: "Article", in: managedObjectContext)
        let article = NSManagedObject(entity: entity!,insertInto: managedObjectContext)
        //let art = Article()
        
        
        article.setValue(title, forKey: "title") //art.title
        article.setValue(content, forKey: "content") //art.content
        article.setValue(lang, forKey: "tongue") //art.tongue
        article.setValue(image, forKey: "picture") //art.picture
        article.setValue(atCreate, forKey: "creation_date") //art.creation_date
        article.setValue(atModefied, forKey: "change_date") //art.change_date
        
        return article as! Article
    }
    
    public func getAllArticles() -> [Article]
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entity(forEntityName: "Article", in: self.managedObjectContext)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        
        do {
            let result = try self.managedObjectContext.fetch(fetchRequest)
            return (result as? [Article])!
            
        } catch {
            return []
        }
    }
    
    public func getArticles(withLang lang : String) -> [Article]
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        
        // Create Predicate
        let predicate = NSPredicate(format: "%K == %@", "lang", lang)
        fetchRequest.predicate = predicate
        
        // Execute Fetch Request
        do {
            let result = try self.managedObjectContext.fetch(fetchRequest)
            return (result as? [Article])!
            
        } catch {
            _ = error as NSError
            return []
        }
    }
    
    public func getArticles(containString str : String) -> [Article]
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        
        // Create Predicate
        let predicate = NSPredicate(format: "content CONTAINS %@ OR title CONTAINS %@", str)
        fetchRequest.predicate = predicate
        
        // Execute Fetch Request
        do {
            let result = try self.managedObjectContext.fetch(fetchRequest)
            return (result as? [Article])!
            
        } catch {
            _ = error as NSError
            return []
        }
        
    }
    
    public func removeArticle(article : Article)
    {
        managedObjectContext.delete(article)
    }
    
    public func save()
    {
        do {
            try managedObjectContext.save()
        }
        catch {
            print("Error save()")
        }
    }
    
}
