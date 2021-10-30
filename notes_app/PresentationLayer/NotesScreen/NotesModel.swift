//
//  NotesModel.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import Foundation

class NotesModel {
    private let repository: NotesRepository
    
    init(repository: NotesRepository) {
        self.repository = repository
    }
}
