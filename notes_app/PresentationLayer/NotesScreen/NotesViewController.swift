//
//  NotesViewController.swift
//  notes_app
//
//  Created by Egor Fedyaev on 29.10.2021.
//

import UIKit

protocol NotesViewDelegate: AnyObject {
    func didUpdateData()
}

final class NotesViewController: UIViewController {
    private let interactor: INotesInteractor
    
    private let notesTitle = "Notes"
    private let cellId = "notesCell"
    
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(NoteCell.self, forCellWithReuseIdentifier: cellId)
        return collectionView
    }()
    
    init(interactor: INotesInteractor) {
        self.interactor = interactor
        super.init(nibName: nil,
                   bundle: nil)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.title = notesTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addTapped))
        
        self.view.addSubview(collectionView)

    }
    
    @objc
    private func addTapped() {
        guard let navigation = self.navigationController else {
            return
        }
        
        interactor.showAddNoteVC(navigation: navigation)
    }
}

extension NotesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? NoteCell {
            let item = interactor.getNotes()[indexPath.row]
            cell.setup(title: item.title, body: item.body)
            return cell
        } else {
            fatalError("Unable to dequeue cell of type NoteCell")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interactor.getNotes().count
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let identifier = "\(indexPath.row)" as NSString
        return UIContextMenuConfiguration(identifier: identifier, previewProvider: .none) { _ in
            let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: UIMenuElement.Attributes.destructive) { [weak self] _ in
                self?.interactor.delete(at: indexPath.row)
            }
            return UIMenu(title: "", options: .destructive, children: [deleteAction])
        }
    }
}

extension NotesViewController: NotesViewDelegate {
    func didUpdateData() {
        collectionView.reloadData()
    }
}

