//
//  CoreDataManager.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import Foundation

protocol ILocalStorage {
    func getNotes() -> [NoteDTO]
}

class CoreDataManager: ILocalStorage {
    private let mockNotes = [
        NoteDTO(title: "Ligma",
                body: "A deadly desease that may be transfered through jokes. Subtype of Joe-like jokes that can often be caught on the internet by newbies.",
                createdAt: Date()),
        NoteDTO(title: "Ligma",
                body: "A deadly desease that may be transfered through jokes. Subtype of Joe-like jokes that can often be caught on the internet by newbies.",
                createdAt: Date()),
    ]
    func getNotes() -> [NoteDTO] {
        return mockNotes
    }
}
