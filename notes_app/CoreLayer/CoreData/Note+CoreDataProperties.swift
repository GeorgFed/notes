//
//  Note+CoreDataProperties.swift
//  notes_app
//
//  Created by Egor Fedyaev on 30.10.2021.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var title: String
    @NSManaged public var body: String
    @NSManaged public var createdAt: Date

}

extension Note : Identifiable {

}
