//
//  NotesViewController.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import UIKit

protocol NotesViewDelegate: AnyObject {
    
}

final class NotesViewController: UIViewController {
    private let interactor: INotesInteractor
    
    init(interactor: INotesInteractor) {
        self.interactor = interactor
        super.init(nibName: nil,
                   bundle: nil)
        self.view.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NotesViewController: NotesViewDelegate {
    
}

