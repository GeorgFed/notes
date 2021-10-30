//
//  AppGraph.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import Foundation
import UIKit

final class AppGraph {
    private let injector: IServiceLocator
    private let startpointGraph: NotesGraph
    
    public var viewController: UIViewController {
        startpointGraph.viewController
    }
    
    init() {
        injector = ServiceLocator()
        startpointGraph = injector.buildNotes()
    }
}
