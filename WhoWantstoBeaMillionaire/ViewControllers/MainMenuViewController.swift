//
//  MainMenuViewController.swift
//  WhoWantstoBeaMillionaire
//
//  Created by mac on 03.12.2022.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    // MARK: - Create Object
    
    private let backImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "cover")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    
    private lazy var newGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.875690937, green: 0.3231568933, blue: 0.05884259194, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("New game", for: .normal)
        button.titleLabel?.font = UIFont(name: "System Bold", size: 30)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.addTarget(self, action: #selector(newGameButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var recordsButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.875690937, green: 0.3231568933, blue: 0.05884259194, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Records", for: .normal)
        button.titleLabel?.font = UIFont(name: "System Bold", size: 30)
        button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.addTarget(self, action: #selector(recordsButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    @objc private func newGameButtonTapped() {
        let gameViewController = GameViewController()
        gameViewController.modalPresentationStyle = .fullScreen
        present(gameViewController, animated: true)
        let gameSession = GameSession()
        Game.shared.gameSession = gameSession
        gameViewController.delegate = gameSession
    }
    
    @objc private func recordsButtonTapped() {
        let newViewController = RecordsViewController()
        newViewController.modalPresentationStyle = .fullScreen
        present(newViewController, animated: true)
    }
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2384825349, green: 0.2269218862, blue: 0.492736876, alpha: 1)
        setupViews()
        setConstraints()
        
    }
    // MARK: - setupViews()
    
    private func setupViews() {
        
        view.addSubview(backImage)
        view.addSubview(newGameButton)
        view.addSubview(recordsButton)
    }
}

// MARK: - setConstraints()

extension MainMenuViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            
            newGameButton.topAnchor.constraint(equalTo: backImage.bottomAnchor, constant: 30),
            newGameButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            newGameButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            recordsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            recordsButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            recordsButton.topAnchor.constraint(equalTo: newGameButton.bottomAnchor, constant: 20)
            

        ])
    }
}
