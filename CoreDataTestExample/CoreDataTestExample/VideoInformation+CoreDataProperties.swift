//
//  VideoInformation+CoreDataProperties.swift
//  CoreDataTestExample
//
//  Created by 황정현 on 2022/10/19.
//
//

import Foundation
import CoreData


extension VideoInformation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VideoInformation> {
        return NSFetchRequest<VideoInformation>(entityName: "VideoInformation")
    }

    @NSManaged public var gymName: String?
    @NSManaged public var gymVisitDate: Date?
    @NSManaged public var videoUrl: String?
    @NSManaged public var problemLevel: Int16
    @NSManaged public var isSucceeded: Bool
    @NSManaged public var isFavorite: Bool
    @NSManaged public var feedback: String?

}

extension VideoInformation : Identifiable {

}
