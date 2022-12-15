//
//  SequentialOrderOfQuestionsStrategy.swift
//  WhoWantstoBeaMillionaire
//
//  Created by mac on 15.12.2022.
//

import Foundation

final class SequentialOrderOfQuestionsStrategy: OrderOfQuestionsStrategy {
    func getQuestions() -> [Question] {
        return Game.shared.questions
    }
}
