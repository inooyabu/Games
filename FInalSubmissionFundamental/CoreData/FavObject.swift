//
//  FavObject.swift
//  FInalSubmissionFundamental
//
//  Created by Tenti Atika Putri on 03/10/21.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
