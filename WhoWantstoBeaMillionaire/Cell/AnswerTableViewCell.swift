//
//  AnswerCell.swift
//  WhoWantstoBeaMillionaire
//
//  Created by mac on 04.12.2022.
//

import Foundation

import UIKit

class AnswerTableViewCell: UITableViewCell {
    
    private let backImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "backAnswerView")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let answerLabel: UILabel = {
       let label = UILabel()
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "System Bold", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
  
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - setupViews
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(backImage)
        addSubview(answerLabel)
        
        
        }
    
    public func answerForCell(answer: String) {
        answerLabel.text = answer
    }
}
// MARK: - setConstraints

extension AnswerTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            backImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            backImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            answerLabel.centerYAnchor.constraint(equalTo: backImage.centerYAnchor),
            answerLabel.leadingAnchor.constraint(equalTo: backImage.leadingAnchor, constant: 30),
            answerLabel.trailingAnchor.constraint(equalTo: backImage.trailingAnchor, constant: -10),
            answerLabel.heightAnchor.constraint(equalToConstant: 70),
            
            
        ])
        
    }
    
    
}
