//
//  ServiceLocator.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import Foundation

protocol IServiceLocator {
    func buildNotes() -> NotesGraph
}

final class ServiceLocator: IServiceLocator {
    
    private let coreData = CoreDataManager()
    
    private var notesRepository: NotesRepository {
        NotesRepository(localStorage: coreData)
    }
    
    func buildNotes() -> NotesGraph {
        return NotesGraph(serviceLocator: self, repository: notesRepository)
    }
    
    func buildAddNote(observer: IAddNoteObserver) -> AddNoteGraph {
        return AddNoteGraph(observer: observer, repository: notesRepository)
    }
}
