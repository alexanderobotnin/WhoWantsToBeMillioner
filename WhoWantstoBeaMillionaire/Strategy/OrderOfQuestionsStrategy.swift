//
//  OrderOfQuestionsStrategy.swift
//  WhoWantstoBeaMillionaire
//
//  Created by mac on 15.12.2022.
//

import Foundation

protocol OrderOfQuestionsStrategy {
    func getQuestions() -> [Question]
}
