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
    
    func getNotes() -> [Note] {
        return localStorage.getNotes()
    }
    
    func addNote(title: String, body: String, createdAt: Date) {
        localStorage.addNote(title: title, body: body, date: createdAt)
    }
    
    func delete(at index: Int) {
        localStorage.delete(at: index)
    }
}
