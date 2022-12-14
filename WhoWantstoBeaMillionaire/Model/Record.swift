//
//  Record.swift
//  WhoWantstoBeaMillionaire
//
//  Created by mac on 10.12.2022.
//

import Foundation

struct Record: Codable {
    let date: Date
    let cashPrize: Int
    let percentOfCorrectAnswers: Double
}
