//
//  CoreDataManager.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import Foundation
import CoreData

protocol ILocalStorage {
    func getNotes() -> [Note]
    func addNote(title: String, body: String, date: Date)
    func delete(at index: Int)
}

class CoreDataManager: ILocalStorage {
    
    private var notes: [Note]?
    
    let context: NSManagedObjectContext = {
        let container = NSPersistentContainer(name: "CoreDataNotes")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Container loading failed")
            }
        }
        return container.viewContext
    }()
    
    func getNotes() -> [Note] {
        if let notes = try? context.fetch(Note.fetchRequest()) {
            self.notes = notes.sorted(by: {
                $0.createdAt.compare($1.createdAt) == .orderedDescending
            })
        } else {
            self.notes = []
        }
        return self.notes ?? []
    }
    
    func addNote(title: String, body: String, date: Date) {
        let note = Note(context: context)
        
        note.title = title
        note.body = body
        note.createdAt = date
        
        notes?.append(note)
        saveNotes()
    }
    
    private func saveNotes() {
        if context.hasChanges {
            try? context.save()
        }
        
        if let notes = try? context.fetch(Note.fetchRequest()) {
            self.notes = notes
        } else {
            self.notes = []
        }
    }
    
    func delete(at index: Int) {
        guard let notes = notes else {
            return
        }

        self.context.delete(notes[index])
        // self.notes?.remove(at: index)
        saveNotes()
    }
}
