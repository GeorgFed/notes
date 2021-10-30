//
//  NoteCell.swift
//  notes_app
//
//  Created by Egor Fedyaev on 30.10.2021.
//

import UIKit

class NoteCell: UICollectionViewCell {
    
    private var titleText: String?
    private var bodyText: String?
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = titleText
        label.numberOfLines = 0
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var body: UILabel = {
        let label = UILabel()
        label.text = bodyText
        label.textColor = .label
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        titleText = nil
        bodyText = nil
    }
    
    public func setup(title: String, body: String) {
        self.titleText = title
        self.bodyText = body
        setupUI()
    }
    
    private func setupUI() {
        addSubview(title)
        addSubview(body)
        
        self.backgroundColor = .systemFill
        self.layer.cornerRadius = 15.0
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 64),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            body.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            body.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            body.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            body.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2),
        ])
    }
}
