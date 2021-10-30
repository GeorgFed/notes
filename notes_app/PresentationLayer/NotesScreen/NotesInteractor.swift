//
//  NotesInteractor.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import Foundation
import UIKit

protocol IAddNoteObserver: AnyObject {
    func didUpdateNotes()
}

protocol INotesInteractor {
    func setViewDelegate(viewDelegate: NotesViewDelegate)
    func getNotes() -> [NoteDTO]
    func showAddNoteVC(navigation: UINavigationController)
}

final class NotesInteractor: INotesInteractor {
    
    private let model: NotesModel
    private let serviceLocator: ServiceLocator
    
    weak var viewDelegate: NotesViewDelegate?
    
    init(serviceLocator: ServiceLocator, model: NotesModel) {
        self.model = model
        self.serviceLocator = serviceLocator
    }
    
    func setViewDelegate(viewDelegate: NotesViewDelegate) {
        self.viewDelegate = viewDelegate
    }
    
    func getNotes() -> [NoteDTO] {
        // not very optimized though...
        return model.getNotes()
        // .sorted { $0.createdAt > $1.createdAt }
    }
    
    func showAddNoteVC(navigation: UINavigationController) {
        let addNoteGraph = serviceLocator.buildAddNote(observer: self)
        let addNoteVC = addNoteGraph.viewController
        navigation.pushViewController(addNoteVC, animated: true)
    }
}

extension NotesInteractor: IAddNoteObserver {
    func didUpdateNotes() {
        let data = model.fetchNotes()
        viewDelegate?.didUpdateData()
    }
}
