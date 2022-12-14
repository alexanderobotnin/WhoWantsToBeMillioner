//
//  GameViewController.swift
//  WhoWantstoBeaMillionaire
//
//  Created by mac on 04.12.2022.
//

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func gameViewController(_ viewController: GameViewController, chooseRightAnswerIn question: Question)
}

class GameViewController: UIViewController {
    
    var questions: [Question] = Question.getCommonQuestions()
    weak var delegate: GameViewControllerDelegate?
    
    // MARK: - Create Object

    private let answersTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.delaysContentTouches = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AnswerTableViewCell.self, forCellReuseIdentifier: "idTableViewCell")
        return tableView
    }()
    

    
    
    // MARK: - viewDidLoad()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        answersTableView.delegate = self
        answersTableView.dataSource = self
        
        
        
        
    }
    
    // MARK: - setupViews()
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.01319833752, green: 0.04768597335, blue: 0.252333045, alpha: 1)
        view.addSubview(answersTableView)
       
    }
    
   
}

// MARK: - setConstraints()

extension GameViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([

            answersTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            answersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            answersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            answersTableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)

        ])
    }
}
//MARK: - UITableViewDataSource
extension GameViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questions[0].answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "idTableViewCell", for: indexPath) as? AnswerTableViewCell else {
            return UITableViewCell()}
        cell.answerForCell(answer: "\(questions[0].answers[indexPath.row])")
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        let label = createHeaderLabel(section)
        label.autoresizingMask = [.flexibleHeight]
        headerView.addSubview(label)
        return headerView
    }

    func createHeaderLabel(_ section: Int) -> UILabel {
        let widthPadding: CGFloat = 15.0
        let label: UILabel = UILabel(frame: CGRect(x: widthPadding, y: 0, width: self.view.frame.width - widthPadding * 2, height: 0))
        label.text = questions[section].question
        label.numberOfLines = 3;
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UITableViewHeaderFooterView()
        
        let label = createFooterLabel(section)
        label.autoresizingMask = [.flexibleHeight]
        footerView.addSubview(label)
        return footerView
    }
    
    func createFooterLabel(_ section: Int) -> UILabel {
        let widthPadding: CGFloat = 15.0
        let label: UILabel = UILabel(frame: CGRect(x: widthPadding, y: 0, width: self.view.frame.width - widthPadding * 2, height: 30))
        label.text = "Вопрос № \((Game.shared.gameSession?.countCorrectAnswers ?? 0) + 1) из \(Game.shared.questions.count)"
        label.numberOfLines = 1;
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return label
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let question = questions[indexPath.section]
        
        if question.correctAnswer == indexPath.row {
            self.delegate?.gameViewController(self, chooseRightAnswerIn: question)
            questions.remove(at: indexPath.section)
            
            if questions.count > 0 {
                tableView.reloadData()
            } else {
                self.endGame()
            }
        } else {
            self.endGame()
        }
    }
    
    func endGame() {
        Game.shared.endGame()
        dismiss(animated: true)
    }
 
    
}

//MARK: - UITableViewDelegate
extension GameViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
}
