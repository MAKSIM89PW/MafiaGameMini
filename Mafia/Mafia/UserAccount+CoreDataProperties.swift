//
//  UserAccount+CoreDataProperties.swift
//  Mafia
//
//  Created by Максим Нурутдинов on 29.04.2023.
//

import Foundation
import CoreData

extension UserAccount {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserAccount> {
        return NSFetchRequest<UserAccount>(entityName: "UserAccount")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int
    
//    @NSManaged public var rating: Int16
//    @NSManaged public var numberOfGames: Int16
//    @NSManaged public var numberOfTurns: Int16
//    @NSManaged public var numberOfWins: Int16
}
