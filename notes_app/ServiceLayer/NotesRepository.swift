//
//  NotesRepository.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import Foundation

class NotesRepository {
    private let localStorage: ILocalStorage
    
    init(localStorage: ILocalStorage) {
        self.localStorage = localStorage
    }
    
    func getNotes() -> [NoteDTO] {
        return localStorage.getNotes()
    }
    
    func addNote(title: String, body: String, createdAt: Date) {
        let note = NoteDTO(title: title,
                           body: body,
                           createdAt: createdAt)
        localStorage.addNote(note: note)
    }
}
