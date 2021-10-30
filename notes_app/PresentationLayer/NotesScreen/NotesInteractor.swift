//
//  NotesInteractor.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import Foundation

protocol INotesInteractor {
    func setViewDelegate(viewDelegate: NotesViewDelegate)
    func getNotes() -> [NoteDTO]
}

final class NotesInteractor: INotesInteractor {
    
    private let model: NotesModel
    
    weak var viewDelegate: NotesViewDelegate?
    
    init(model: NotesModel) {
        self.model = model
    }
    
    func setViewDelegate(viewDelegate: NotesViewDelegate) {
        self.viewDelegate = viewDelegate
    }
    
    func getNotes() -> [NoteDTO] {
        return model.getNotes()
    }
}
