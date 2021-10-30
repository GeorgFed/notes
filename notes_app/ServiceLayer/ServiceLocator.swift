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
    
    func buildNotes() -> NotesGraph {
        let notesRepository = NotesRepository(localStorage: coreData)
        return NotesGraph(repository: notesRepository)
    }
}
