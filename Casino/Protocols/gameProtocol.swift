//
//  gameProtocol.swift
//  Casino
//
//  Created by Jimmy Meriläinen on 2021-02-15.
//

import Foundation

protocol gameProtocol {
    var cardArray: [Card] { get set }
    
    func getScore() -> String
    func getCard() -> Card
    func check(answer: Bool) -> Bool
    func nextCard() -> Bool
    func reset()
    func addScore()
}
