//
//  FavoriteGameEntity+CoreDataProperties.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 02/10/21.
//
//

import Foundation
import CoreData

extension FavoriteGameEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteGameEntity> {
        return NSFetchRequest<FavoriteGameEntity>(entityName: "FavoriteGameEntity")
    }

    @NSManaged public var backgroundImage: String?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var rating: Double
    @NSManaged public var rawDescription: String?
    @NSManaged public var released: String?
    @NSManaged public var website: String?
}

extension FavoriteGameEntity : Identifiable {

}
