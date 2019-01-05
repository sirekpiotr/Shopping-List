//
//  NothingView.swift
//  Shopping List
//
//  Created by Piotr Sirek on 01/01/2019.
//  Copyright © 2019 Piotr Sirek. All rights reserved.
//

import UIKit

class NothingView: UIView {
    
    var nothingLabel: UILabel!
    var nothingSublabel: UILabel!
    var addFirstProductButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nothingLabel = UILabel()
        nothingSublabel = UILabel()
        addFirstProductButton = UIButton()
        
        nothingLabel.text = "Now you don't have any product"
        nothingSublabel.text = "Tap button to begin"
        
        addFirstProductButton.backgroundColor = .black
        addFirstProductButton.layer.cornerRadius = 12
        addFirstProductButton.setTitle("Add", for: .normal)
        
        prepareView()
    }
    
    private func prepareView() {
        nothingLabel.translatesAutoresizingMaskIntoConstraints = false
        nothingSublabel.translatesAutoresizingMaskIntoConstraints = false
        addFirstProductButton.translatesAutoresizingMaskIntoConstraints = false
        
        nothingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200).isActive = true
        nothingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        nothingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 50).isActive = true
        nothingLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nothingSublabel.topAnchor.constraint(equalTo: self.nothingLabel.bottomAnchor, constant: 20).isActive = true
        nothingSublabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
        nothingSublabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 50).isActive = true
        nothingSublabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        nothingSublabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40).isActive = true
        addFirstProductButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        addFirstProductButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 40).isActive = true
        addFirstProductButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        self.addSubview(nothingLabel)
        self.addSubview(nothingSublabel)
        self.addSubview(addFirstProductButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
