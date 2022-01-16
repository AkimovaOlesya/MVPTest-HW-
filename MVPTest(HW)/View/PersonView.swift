//
//  PersonView.swift
//  MVPTest(HW)
//
//  Created by Леся Акимова on 16.01.2022.
//

import UIKit

protocol PersonViewDelegate: AnyObject {
    
    func actionDidPressed()
}

class PersonView: UIView {
    
    weak var delegate: PersonViewDelegate?
    
    lazy var personImage: UIImageView = {
        let personView = UIImageView()
        personView.clipsToBounds = true
        personView.layer.cornerRadius = 15
        personView.image = UIImage(systemName: "person.fill")
        personView.layer.borderColor = UIColor.lightGray.cgColor
        personView.layer.borderWidth = 1
        personView.translatesAutoresizingMaskIntoConstraints = false
        return personView
    }()
    
    lazy var personName: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red:247/255.0, green:180/255.0, blue:46/255.0, alpha:1.0)
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.textAlignment = .center
        label.font = UIFont(name: "Charter Black", size: 14)
        label.textColor = UIColor(red:38/255.0, green:39/255.0, blue:53/255.0, alpha:1.0)
        label.text = "Nickname"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var getPersonButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red:225/255.0, green:79/255.0, blue:78/255.0, alpha:1.0)
        button.layer.cornerRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 1, height: 0)
        button.layer.shadowColor = UIColor.black.cgColor
        button.setTitle("Random", for: .normal)
        button.addTarget(nil, action: #selector(getPersonButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red:38/255.0, green:39/255.0, blue:53/255.0, alpha:1.0)
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func setupHierarchy() {
        addSubview(personImage)
        addSubview(personName)
        addSubview(getPersonButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            personImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            personImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            personImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            personImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200),
            
            personName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            personName.bottomAnchor.constraint(equalTo: personImage.topAnchor, constant: 20),
            personName.heightAnchor.constraint(equalToConstant: 50),
            personName.widthAnchor.constraint(equalToConstant: 150),

            getPersonButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            getPersonButton.topAnchor.constraint(equalTo: personImage.bottomAnchor, constant: 50),
            getPersonButton.heightAnchor.constraint(equalToConstant: 50),
            getPersonButton.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    @objc private func getPersonButtonPressed() {
        delegate?.actionDidPressed()
    }
}
