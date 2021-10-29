//
//  NotesGraph.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import Foundation
import UIKit

final class NotesGraph {
    private let view: NotesViewController
    private let interactor: INotesInteractor
    private let model: NotesModel
    
    public var viewController: UIViewController {
        view
    }
    init(repository: NotesRepository) {
        model = NotesModel(repository: repository)
        interactor = NotesInteractor(model: model)
        view = NotesViewController(interactor: interactor)
        interactor.setViewDelegate(viewDelegate: view)
    }
}
