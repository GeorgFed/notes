//
//  NotesModel.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import Foundation

class NotesModel {
    private let repository: NotesRepository
    
    private(set) var notes: [NoteDTO]?
    
    init(repository: NotesRepository) {
        self.repository = repository
    }
    
    func getNotes() -> [NoteDTO] {
        if let notes = notes {
            return notes
        } else {
            notes = repository.getNotes()
            return notes ?? []
        }
    }
}
