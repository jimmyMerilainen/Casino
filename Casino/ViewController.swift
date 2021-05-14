//
//  ViewController.swift
//  Casino
//
//  Created by Jimmy Meriläinen on 2021-01-25.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var cardOne: UIImageView!
    @IBOutlet weak var cardTwo: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var cardsLeft: UILabel!
    
    
    var highLow = "Högre eller lägre?"
    var color = "Svart eller rött?"
    
    var index = 0
    var cardCountDown = 52
    
    var counter = 1
    
    var deckOfCards = [ #imageLiteral(resourceName: "spaderA"), #imageLiteral(resourceName: "spader2"), #imageLiteral(resourceName: "spader3"), #imageLiteral(resourceName: "spader4"), #imageLiteral(resourceName: "spader5"), #imageLiteral(resourceName: "spader6"), #imageLiteral(resourceName: "spader7"), #imageLiteral(resourceName: "spader8"), #imageLiteral(resourceName: "spader9"), #imageLiteral(resourceName: "spader10"), #imageLiteral(resourceName: "spaderJ"), #imageLiteral(resourceName: "spederQ"), #imageLiteral(resourceName: "spederK"), #imageLiteral(resourceName: "ruterA"), #imageLiteral(resourceName: "ruter2"), #imageLiteral(resourceName: "ruter3"), #imageLiteral(resourceName: "ruter4"), #imageLiteral(resourceName: "ruter5"), #imageLiteral(resourceName: "ruter6"), #imageLiteral(resourceName: "ruter7"), #imageLiteral(resourceName: "ruter8"), #imageLiteral(resourceName: "ruter9"), #imageLiteral(resourceName: "ruter10"), #imageLiteral(resourceName: "ruterJ"), #imageLiteral(resourceName: "ruterQ"), #imageLiteral(resourceName: "ruterK"), #imageLiteral(resourceName: "klöverA"), #imageLiteral(resourceName: "klöver2"), #imageLiteral(resourceName: "klöver3"), #imageLiteral(resourceName: "klöver4"), #imageLiteral(resourceName: "klöver5"), #imageLiteral(resourceName: "klöver6"), #imageLiteral(resourceName: "klöver7"), #imageLiteral(resourceName: "klöver8"), #imageLiteral(resourceName: "klöver9"), #imageLiteral(resourceName: "klöver10"), #imageLiteral(resourceName: "klöverJ"), #imageLiteral(resourceName: "klöverQ"), #imageLiteral(resourceName: "klöverK"), #imageLiteral(resourceName: "hjärterA"), #imageLiteral(resourceName: "hjärter2"), #imageLiteral(resourceName: "hjärter3"), #imageLiteral(resourceName: "hjärter4"), #imageLiteral(resourceName: "hjärter5"), #imageLiteral(resourceName: "hjärter6"), #imageLiteral(resourceName: "hjärter7"), #imageLiteral(resourceName: "hjärter8"), #imageLiteral(resourceName: "hjärter9"), #imageLiteral(resourceName: "hjärter10"), #imageLiteral(resourceName: "hjärterJ"), #imageLiteral(resourceName: "hjärterQ"), #imageLiteral(resourceName: "hjärterK")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetupGame()
        
    }
    func SetupGame() {
        cardOne.image = nil
        cardTwo.image = #imageLiteral(resourceName: "backside")
        infoLabel.text = highLow
        
        deckOfCards.shuffle()
        cardsLeft.text = String(cardCountDown)
    }
    
    @IBAction func nextCard(_ sender: UIButton) {
        sender.isEnabled = false
        
        let bild = deckOfCards[index]
        
        cardTwo.image = bild
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("timer fired!")
                        
            self.counter -= 1
                    
            print(self.counter)
                        
            if(self.counter==0){
                timer.invalidate()
                self.counter = 1
                self.newCards(card: bild)
                sender.isEnabled = true
            }
        }
    }
    func newCards(card: UIImage) {
        cardOne.image = card
        cardTwo.image = #imageLiteral(resourceName: "backside")
        index += 1
        print(index)
        cardCountDown -= 1
        cardsLeft.text = String(cardCountDown)
        
        if cardCountDown == 0 {
            cardTwo.image = nil
            showFinalScore()
        }
        
        if infoLabel.text == highLow{
            infoLabel.text = color
        }
        else if infoLabel.text == color {
            infoLabel.text = highLow
        }
        
    }
    func showFinalScore() {
        let alert = UIAlertController(title: "Korten är slut", message: "Spela igen", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.restart()
            self.SetupGame()
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }
    func restart() {
        index = 0
        cardCountDown = 52
        
    }
    
    
    @IBAction func ResetButton(_ sender: UIButton) {
        self.restart()
        self.SetupGame()
        
    }
    
    
    
}

