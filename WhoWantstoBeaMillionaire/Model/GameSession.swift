//
//  GameSession.swift
//  WhoWantstoBeaMillionaire
//
//  Created by mac on 10.12.2022.
//

import Foundation

class GameSession {
    
    var countQuestions: Int = Game.shared.questions.count
    //var countCorrectAnswers: Int = 0
    var cashPrize: Int = 0
    var countCorrectAnswers: Observable<Int> = Observable(0)
    var percentOfCorrectAnswers: Double {
        get {
            return Double(self.countCorrectAnswers.value) / Double(self.countQuestions)
        }
    }
}

extension GameSession: GameViewControllerDelegate {
    func gameViewController(_ viewController: GameViewController, chooseRightAnswerIn question: Question) {
        self.countCorrectAnswers.value += 1
        self.cashPrize += question.cashPrize
    }
}
