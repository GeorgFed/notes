//
//  AddNoteInteractor.swift
//  notes_app
//
//  Created by Egor Fedyaev on 30.10.2021.
//

import Foundation
import UIKit

protocol IAddNoteInteractor {
    
    func setObserver(observer: IAddNoteObserver)
    func addNote(navigation: UINavigationController, title: String, body: String)
}

class AddNoteInteractor: IAddNoteInteractor {
    
    private let repository: NotesRepository
    
    weak var observer: IAddNoteObserver?
    
    init(repository: NotesRepository) {
        self.repository = repository
    }
    
    func setObserver(observer: IAddNoteObserver) {
        self.observer = observer
    }
    
    func addNote(navigation: UINavigationController, title: String, body: String) {
        repository.addNote(title: title, body: body, createdAt: Date())
        guard let observer = observer else {
            return
        }
        observer.didUpdateNotes()
        navigation.popViewController(animated: true)
    }
}
