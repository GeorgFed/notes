//
//  AddNoteGraph.swift
//  notes_app
//
//  Created by Egor Fedyaev on 30.10.2021.
//

import UIKit

class AddNoteGraph {
    let view: AddNoteVC
    let interactor: IAddNoteInteractor
    
    public var viewController: UIViewController {
        view
    }
    
    init(observer: IAddNoteObserver, repository: NotesRepository) {
        interactor = AddNoteInteractor(repository: repository)
        view = AddNoteVC(interactor: interactor)
        interactor.setObserver(observer: observer)
    }
}
