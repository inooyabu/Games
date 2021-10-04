//
//  FavManager.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 03/10/21.
//

import Foundation
import CoreData

class FavManager {
    static let shared = FavManager(moc: NSManagedObjectContext.current)
    var moc: NSManagedObjectContext

    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }

    func addFavorite(favoriteGame: FavoriteGameEntity) throws {
        self.moc.insert(favoriteGame)
        try self.moc.save()
    }

    func getFavoriteId(_ id: Int32, completion: @escaping(FavoriteGameModel?) -> ()) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteGameEntity")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "id == \(id)")

        do {
            if let result = try self.moc.fetch(fetchRequest).first {
                let favoriteGame = FavoriteGameModel (
                    backgroundImage: result.value(forKeyPath: "backgroundImage") as? String,
                    id: result.value(forKeyPath: "id") as? Int32,
                    name: result.value(forKeyPath: "name") as? String,
                    rating: result.value(forKeyPath: "rating") as? Double,
                    rawDescription: result.value(forKeyPath: "rawDescription") as? String,
                    released: result.value(forKeyPath: "released") as? String,
                    website: result.value(forKeyPath: "website") as? String)
                DispatchQueue.main.async {
                    completion(favoriteGame)
                }
            }
        } catch let error as NSError {
            print("Couldn't fetch. \(error), \(error.userInfo)")
        }
    }

    func deleteFavorite(id: Int32) throws {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteGameEntity")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "id == \(id)")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        batchDeleteRequest.resultType = .resultTypeCount

        do {
            try self.moc.execute(batchDeleteRequest)
        } catch let error as NSError {
            print("Errornya adalah \(error)")
        }
    }

    func getFavorite() -> [FavoriteGameEntity] {
        var favGame = [FavoriteGameEntity]()
        let postRequest: NSFetchRequest<FavoriteGameEntity> = FavoriteGameEntity.fetchRequest()

        do {
            favGame = try self.moc.fetch(postRequest)
        } catch let error as NSError {
            print(error)
        }
        return favGame
    }
}
