//
//  Game.swift
//  WhoWantstoBeaMillionaire
//
//  Created by mac on 10.12.2022.
//

import Foundation

final class Game {
    static let shared = Game()
    
    var gameSession: GameSession?
    
    var difficulty: Difficulty = .sequential
    
    var questions: [Question] {
        didSet {
            questionsCaretaker.save(questions: self.questions)
        }
    }
    
    private(set) var records: [Record] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }
    
    private let recordsCaretaker = RecordsCaretaker()
    private let questionsCaretaker = QuestionsCaretaker()
    
    private init() {
        self.records = self.recordsCaretaker.retrieveRecords()
        self.questions = self.questionsCaretaker.retrieveQuestions()
    }
    
    func endGame() {
        guard let gameSession = self.gameSession else { return }
        
        let record = Record(date: Date(), cashPrize: gameSession.cashPrize, percentOfCorrectAnswers: gameSession.percentOfCorrectAnswers)
        self.addRecord(record)
        
        self.gameSession = nil
    }
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func addQuestions(_ questions: [Question]) {
        self.questions += questions
    }
}
