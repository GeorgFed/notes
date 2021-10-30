//
//  NotesModel.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import Foundation

class NotesModel {
    private let repository: NotesRepository
    
    private(set) var notes: [Note]?
    
    init(repository: NotesRepository) {
        self.repository = repository
    }
    
    func getNotes() -> [Note] {
        if let notes = notes {
            return notes
        } else {
            return fetchNotes()
        }
    }
    
    func delete(at index: Int) {
        
    }
    
    @discardableResult
    func fetchNotes() -> [Note] {
        notes = repository.getNotes()
        return notes ?? []
    }
}
