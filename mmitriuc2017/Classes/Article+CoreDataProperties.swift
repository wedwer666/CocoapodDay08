//
//  Article+CoreDataProperties.swift
//  Pods
//
//  Created by Mitriuc Maria on 4/28/17.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article");
    }

    @NSManaged public var title: String?
    @NSManaged public var change_date: NSDate?
    @NSManaged public var creation_date: NSDate?
    @NSManaged public var tongue: String?
    @NSManaged public var picture: String?
    @NSManaged public var content: String?
    
    override public var description: String {
        return "Test"
    }

}

