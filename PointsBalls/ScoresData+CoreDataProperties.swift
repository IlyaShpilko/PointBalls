//
//  ScoresData+CoreDataProperties.swift
//  PointsBalls
//
//  Created by Ilya Shpilko on 11/14/21.
//
//

import Foundation
import CoreData


extension ScoresData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScoresData> {
        return NSFetchRequest<ScoresData>(entityName: "ScoresData")
    }

    @NSManaged public var scores: String
    @NSManaged public var date: Date
    @NSManaged public var textDescription: String
    @NSManaged public var price: String
    @NSManaged public var product: String

}

extension ScoresData : Identifiable {

}
