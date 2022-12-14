//
//  Question.swift
//  WhoWantstoBeaMillionaire
//
//  Created by mac on 04.12.2022.
//

import Foundation

struct Question: Codable {
    var question: String = ""
    var answers: [String] = []
    var correctAnswer: Int = 0
    var cashPrize: Int = 100
    
    static func getCommonQuestions() -> [Question] {
        return [
            Question(
                question: "Что проводит боксер, наносящий удар противнику снизу?",
                answers: [
                    "Хук",
                    "Аперкот",
                    "Антрекот",
                    "Фаталити"
                ],
                correctAnswer: 1,
                cashPrize: 100
            ),
            Question(
                question: "Как называют небольшую круглую елочную игрушку?",
                answers: [
                    "Тузик",
                    "Мопсик",
                    "Шарик",
                    "Бобик"
                ],
                correctAnswer: 2,
                cashPrize: 200
            ),
            Question(
                question: "Между какими сторонами велась гражданская война в США?",
                answers: [
                    "Заподом и Востоком",
                    "Севером и Югом",
                    "Новыми и Старыми",
                    "Темными и Светлыми"
                ],
                correctAnswer: 1,
                cashPrize: 300
            ),
            Question(
                question: "Как называется снимок с экрана, сделанный при помощи клавиши Print Screen?",
                answers: [
                    "Хайп",
                    "Свитшот",
                    "Селфи",
                    "Скриншот"
                ],
                correctAnswer: 3,
                cashPrize: 400
            ),
            Question(
                question: "Столица Австралии?",
                answers: [
                    "Мельбурн",
                    "Сидней",
                    "Камберра",
                    "Банкок"
                ],
                correctAnswer: 2,
                cashPrize: 500
            )]
            
            }
}
