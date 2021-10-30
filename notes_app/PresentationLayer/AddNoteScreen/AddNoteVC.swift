//
//  AddNoteVC.swift
//  notes_app
//
//  Created by Egor Fedyaev on 30.10.2021.
//

import Foundation
import UIKit

class AddNoteVC: UIViewController {
    
    private lazy var titleField: UITextView = {
        let field = UITextView()
        field.delegate = self
        field.isScrollEnabled = false
        field.font = .boldSystemFont(ofSize: 24)
        field.translatesAutoresizingMaskIntoConstraints = false
        field.text = "Title"
        field.textColor = .secondaryLabel
        field.accessibilityIdentifier = "Title"
        return field
    }()
    
    private lazy var bodyField: UITextView = {
        let field = UITextView()
        field.delegate = self
        field.isScrollEnabled = false
        field.font = .systemFont(ofSize: 16)
        field.translatesAutoresizingMaskIntoConstraints = false
        field.text = "Body"
        field.accessibilityIdentifier = "Body"
        field.textColor = .secondaryLabel
        return field
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        self.hideKeyboardWhenTappedAround()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        self.title = "Add note"
        
        view.addSubview(titleField)
        view.addSubview(bodyField)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            titleField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 128),
            titleField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            titleField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            
            bodyField.topAnchor.constraint(equalTo: self.titleField.bottomAnchor, constant: 2),
            bodyField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            bodyField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            
            addButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32),
            addButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32),
            addButton.topAnchor.constraint(equalTo: bodyField.bottomAnchor, constant: 32),
            addButton.heightAnchor.constraint(equalToConstant: 56),
            
        ])
    }
    
    @objc
    private func didTapAddButton() {
        print("Add")
    }
}

extension AddNoteVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .secondaryLabel {
            textView.text = nil
            textView.textColor = .label
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            // hehe
            textView.text = textView.accessibilityIdentifier
            textView.textColor = .secondaryLabel
        }
    }
}
