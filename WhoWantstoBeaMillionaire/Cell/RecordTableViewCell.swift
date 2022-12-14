//
//  RecordTableViewCell.swift
//  WhoWantstoBeaMillionaire
//
//  Created by mac on 10.12.2022.
//

import Foundation
import UIKit

class RecordTableViewCell: UITableViewCell {
    
    private let backImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "backAnswerView")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let dataLabel: UILabel = {
       let label = UILabel()
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "System Bold", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cashLabel: UILabel = {
       let label = UILabel()
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "System Bold", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let percentLabel: UILabel = {
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
        
        addSubview(backImage)
        addSubview(dataLabel)
        addSubview(cashLabel)
        addSubview(percentLabel)
        
        
        }
    
    public func dataPrint(data: String, cash: String, percent: String) {
        dataLabel.text = data
        cashLabel.text = "Выигрыш: \(cash)"
        percentLabel.text = "Верно \(percent)%"
    }
}
// MARK: - setConstraints

extension RecordTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            dataLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            dataLabel.topAnchor.constraint(equalTo: self.topAnchor),
            dataLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            cashLabel.leadingAnchor.constraint(equalTo: dataLabel.trailingAnchor, constant: 5),
            cashLabel.topAnchor.constraint(equalTo: self.topAnchor),
            cashLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            percentLabel.leadingAnchor.constraint(equalTo: cashLabel.trailingAnchor, constant: 5),
            percentLabel.topAnchor.constraint(equalTo: self.topAnchor),
            percentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
        
    }
    
    
}
