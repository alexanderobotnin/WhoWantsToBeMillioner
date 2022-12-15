//
//  RecordsViewController.swift
//  WhoWantstoBeaMillionaire
//
//  Created by mac on 10.12.2022.
//

import Foundation
import UIKit


class RecordsViewController: UIViewController {
    
    
    let dateFormatter: DateFormatter = {
        let data = DateFormatter()
        data.dateStyle = .short
        return data
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Закрыть", for: .normal)
        button.titleLabel?.font = UIFont(name: "System Bold", size: 30)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let recordsTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .none
        //tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.delaysContentTouches = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RecordTableViewCell.self, forCellReuseIdentifier: "recordCellIdentifier")
        return tableView
    }()
    
    var dateTextCache: [IndexPath: String] = [:]
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        setupViews()
        setConstraints()
        recordsTableView.delegate = self
        recordsTableView.dataSource = self
            
        }
    
    // MARK: - setupViews()
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.01240171678, green: 0.05908089131, blue: 0.2517321408, alpha: 1)
        view.addSubview(closeButton)
        view.addSubview(recordsTableView)
        
    }
}

// MARK: - setConstraints()

extension RecordsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            
            recordsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            recordsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            recordsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            recordsTableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
           

        ])
    }
}

// MARK: - DataSource()
extension RecordsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recordCellIdentifier", for: indexPath) as? RecordTableViewCell else {
            return UITableViewCell()}
        let record = Game.shared.records[indexPath.row]
        cell.dataPrint(data: "\(getCellDateText(forIndexPath: indexPath, andDate: record.date))", cash: "\(record.cashPrize)", percent: String(format:"%.2f", record.percentOfCorrectAnswers*100))
        
        return cell
    }
    
    func getCellDateText(forIndexPath indexPath: IndexPath, andDate date: Date) -> String {
        if let stringDate = dateTextCache[indexPath] {
            return stringDate
        } else {
            let stringDate = self.dateFormatter.string(from: date)
            dateTextCache[indexPath] = stringDate
            return stringDate
        }
    }
    
}
