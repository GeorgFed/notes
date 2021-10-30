//
//  NotesInteractor.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import Foundation
import UIKit

protocol INotesInteractor {
    func setViewDelegate(viewDelegate: NotesViewDelegate)
    func getNotes() -> [NoteDTO]
    func showAddNoteVC(navigation: UINavigationController)
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
    
    func showAddNoteVC(navigation: UINavigationController) {
        let addNoteVC = AddNoteVC()
        navigation.pushViewController(addNoteVC, animated: true)
    }
}
