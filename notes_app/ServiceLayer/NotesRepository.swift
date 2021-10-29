//
//  NotesRepository.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import Foundation

class NotesRepository {
    private let localStorage: ILocalStorage
    
    init(localStorage: ILocalStorage) {
        self.localStorage = localStorage
    }
}
