//
//  SettingViewController.swift
//  WhoWantstoBeaMillionaire
//
//  Created by mac on 15.12.2022.
//

import Foundation

import UIKit

class SettingsViewController: UIViewController {
    
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
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    private lazy var difficultyControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Попорядку", "Случайно"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        segmentedControl.selectedSegmentTintColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        segmentedControl.addTarget(self, action: #selector(changeDifficult), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private var selectedDifficulty: Difficulty {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0:
            return .sequential
        case 1:
            return .random
        default:
            return .sequential
        }
    }

    @objc private func changeDifficult(_ sender: Any) {
        Game.shared.difficulty = selectedDifficulty
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        setupViews()
        setConstraints()
        
            
        }
    
    // MARK: - setupViews()
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.01240171678, green: 0.05908089131, blue: 0.2517321408, alpha: 1)
        view.addSubview(closeButton)
        view.addSubview(difficultyControl)
        difficultyControl.selectedSegmentIndex = Game.shared.difficulty.rawValue
        
    }
    
}

// MARK: - setConstraints()

extension SettingsViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            
            difficultyControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            difficultyControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            difficultyControl.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 30)
           

        ])
    }
}
