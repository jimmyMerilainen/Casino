//
//  gameModel.swift
//  Casino
//
//  Created by Jimmy Meriläinen on 2021-02-15.
//

import Foundation
import UIKit


class gameModel: gameProtocol {
    private var index = 0
    private var score = 0
    
    var cardArray: [Card] = [
        Card(cardValue: 2, cardColor: "röd", image: UIImage(named: "hjärter2")!),
        Card(cardValue: 3, cardColor: "röd", image: UIImage(named: "hjärter3")!),
        Card(cardValue: 4, cardColor: "röd", image: UIImage(named: "hjärter4")!),
        Card(cardValue: 5, cardColor: "röd", image: UIImage(named: "hjärter5")!),
        Card(cardValue: 6, cardColor: "röd", image: UIImage(named: "hjärter6")!),
        Card(cardValue: 7, cardColor: "röd", image: UIImage(named: "hjärter7")!),
        Card(cardValue: 8, cardColor: "röd", image: UIImage(named: "hjärter8")!),
        Card(cardValue: 9, cardColor: "röd", image: UIImage(named: "hjärter9")!),
        Card(cardValue: 10, cardColor: "röd", image: UIImage(named: "hjärter10")!),
        Card(cardValue: 11, cardColor: "röd", image: UIImage(named: "hjärterJ")!),
        Card(cardValue: 12, cardColor: "röd", image: UIImage(named: "hjärterQ")!),
        Card(cardValue: 13, cardColor: "röd", image: UIImage(named: "hjärterK")!),
        Card(cardValue: 14, cardColor: "röd", image: UIImage(named: "hjärterA")!),
        Card(cardValue: 2, cardColor: "svart", image: UIImage(named: "klöver2")!),
        Card(cardValue: 3, cardColor: "svart", image: UIImage(named: "klöver3")!),
        Card(cardValue: 4, cardColor: "svart", image: UIImage(named: "klöver4")!),
        Card(cardValue: 5, cardColor: "svart", image: UIImage(named: "klöver5")!),
        Card(cardValue: 6, cardColor: "svart", image: UIImage(named: "klöver6")!),
        Card(cardValue: 7, cardColor: "svart", image: UIImage(named: "klöver7")!),
        Card(cardValue: 8, cardColor: "svart", image: UIImage(named: "klöver8")!),
        Card(cardValue: 9, cardColor: "svart", image: UIImage(named: "klöver9")!),
        Card(cardValue: 10, cardColor: "svart", image: UIImage(named: "klöver10")!),
        Card(cardValue: 11, cardColor: "svart", image: UIImage(named: "klöverJ")!),
        Card(cardValue: 12, cardColor: "svart", image: UIImage(named: "klöverQ")!),
        Card(cardValue: 13, cardColor: "svart", image: UIImage(named: "klöverK")!),
        Card(cardValue: 14, cardColor: "svart", image: UIImage(named: "klöverA")!),
        Card(cardValue: 2, cardColor: "röd", image: UIImage(named: "ruter2")!),
        Card(cardValue: 3, cardColor: "röd", image: UIImage(named: "ruter3")!),
        Card(cardValue: 4, cardColor: "röd", image: UIImage(named: "ruter4")!),
        Card(cardValue: 5, cardColor: "röd", image: UIImage(named: "ruter5")!),
        Card(cardValue: 6, cardColor: "röd", image: UIImage(named: "ruter6")!),
        Card(cardValue: 7, cardColor: "röd", image: UIImage(named: "ruter7")!),
        Card(cardValue: 8, cardColor: "röd", image: UIImage(named: "ruter8")!),
        Card(cardValue: 9, cardColor: "röd", image: UIImage(named: "ruter9")!),
        Card(cardValue: 10, cardColor: "röd", image: UIImage(named: "ruter10")!),
        Card(cardValue: 11, cardColor: "röd", image: UIImage(named: "ruterJ")!),
        Card(cardValue: 12, cardColor: "röd", image: UIImage(named: "ruterQ")!),
        Card(cardValue: 13, cardColor: "röd", image: UIImage(named: "ruterK")!),
        Card(cardValue: 14, cardColor: "röd", image: UIImage(named: "ruterA")!),
        Card(cardValue: 2, cardColor: "svart", image: UIImage(named: "spader2")!),
        Card(cardValue: 3, cardColor: "svart", image: UIImage(named: "spader3")!),
        Card(cardValue: 4, cardColor: "svart", image: UIImage(named: "spader4")!),
        Card(cardValue: 5, cardColor: "svart", image: UIImage(named: "spader5")!),
        Card(cardValue: 6, cardColor: "svart", image: UIImage(named: "spader6")!),
        Card(cardValue: 7, cardColor: "svart", image: UIImage(named: "spader7")!),
        Card(cardValue: 8, cardColor: "svart", image: UIImage(named: "spader8")!),
        Card(cardValue: 9, cardColor: "svart", image: UIImage(named: "spader9")!),
        Card(cardValue: 10, cardColor: "svart", image: UIImage(named: "spader10")!),
        Card(cardValue: 11, cardColor: "svart", image: UIImage(named: "spaderJ")!),
        Card(cardValue: 12, cardColor: "svart", image: UIImage(named: "spederQ")!),
        Card(cardValue: 13, cardColor: "svart", image: UIImage(named: "spederK")!),
        Card(cardValue: 14, cardColor: "svart", image: UIImage(named: "spaderA")!)
    ]
    
    func getScore() -> String {
        return "Poäng: \(score)"
    }
    
    func getCard() -> Card {
        return cardArray[index]
    }
    
    func check(answer: Bool) -> Bool {
        return true
    }
    
    func nextCard() -> Bool {
        index += 1
        if index >= cardArray.count {
            return false
        }
        return true
    }
    
    func reset() {
        index = 0
        score = 0
    }
    func addScore() {
        score += 1
        print("Här blev det poäng! \(score)")
    }
    
    
}
