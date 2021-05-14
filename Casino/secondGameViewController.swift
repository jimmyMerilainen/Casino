//
//  secondGameViewController.swift
//  Casino
//
//  Created by Jimmy Meriläinen on 2021-02-15.
//

import UIKit

class secondGameViewController: UIViewController {
    
    @IBOutlet weak var firtstCardImage: UIImageView!
    @IBOutlet weak var secondCardImage: UIImageView!
    
    @IBOutlet weak var hideStartButton: UIButton!
    @IBOutlet weak var hideHighRedButton: UIButton!
    @IBOutlet weak var hideLowBlackButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    
    let game = gameModel()
    var thisCard: Card?
    
    var testitest: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpGame()
        // Do any additional setup after loading the view.
    }
    func setUpGame() {
        scoreLabel.text = game.getScore()
        game.cardArray.shuffle()
        firtstCardImage.image = nil
        secondCardImage.image = #imageLiteral(resourceName: "backside")
        hideHighRedButton.isHidden = true
        hideLowBlackButton.isHidden = true
        valueTitle()
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        //hideHighRedButton.isHidden = false
        //hideLowBlackButton.isHidden = false
        hideStartButton.isHidden = true
        playGame()
    }
    
    func playGame() {
        thisCard = game.getCard()
        secondCardImage.image = thisCard!.image
        startTimer(card: thisCard!.image)
        
    }
    
    func startTimer(card: UIImage) {
        testitest += 1
        var counter = 1
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("timer fired! \(self.testitest)")
                        
            counter -= 1
            if(counter==0){
                timer.invalidate()
                counter = 1
                self.firtstCardImage.image = card
                self.secondCardImage.image = #imageLiteral(resourceName: "backside")
                self.hideHighRedButton.isHidden = false
                self.hideLowBlackButton.isHidden = false
                self.hideHighRedButton.isEnabled = true
                self.hideLowBlackButton.isEnabled = true
            }
        }
    }
    
    @IBAction func highredButton(_ sender: UIButton) {
        hideHighRedButton.isEnabled = false
        if sender.currentTitle == "Röd" {
            if self.game.nextCard() {
                let newCard = game.getCard()
                if newCard.cardColor == "röd"{
                    game.addScore()
                    scoreLabel.text = game.getScore()
                }
                secondCardImage.image = newCard.image
                thisCard = newCard
                startTimer(card: newCard.image)
                valueTitle()
            }else {
                showFinalScore()
            }
            
        }else if sender.currentTitle == "Högre" {
            if self.game.nextCard() {
                let newCard = game.getCard()
                if newCard.cardValue >= thisCard!.cardValue{
                    game.addScore()
                    scoreLabel.text = game.getScore()
                }
                secondCardImage.image = newCard.image
                thisCard = newCard
                startTimer(card: newCard.image)
                colorTitle()
            }else {
                showFinalScore()
            }
        }
    }
    
    @IBAction func lowBlackButton(_ sender: UIButton) {
        hideLowBlackButton.isEnabled = false
        if sender.currentTitle == "Svart" {
            if self.game.nextCard() {
                let newCard = game.getCard()
                if newCard.cardColor == "svart"{
                    game.addScore()
                    scoreLabel.text = game.getScore()
                }
                secondCardImage.image = newCard.image
                thisCard = newCard
                startTimer(card: newCard.image)
                valueTitle()
            }else {
                showFinalScore()
            }
            
        }else if sender.currentTitle == "Lägre" {
            if self.game.nextCard() {
                let newCard = game.getCard()
                if newCard.cardValue <= thisCard!.cardValue{
                    game.addScore()
                    scoreLabel.text = game.getScore()
                }
                secondCardImage.image = newCard.image
                thisCard = newCard
                startTimer(card: newCard.image)
                colorTitle()
            }else {
                showFinalScore()
            }
        }
        
    }
    func colorTitle() {
        hideHighRedButton.setTitle("Röd", for: .normal)
        hideLowBlackButton.setTitle("Svart", for: .normal)
    }
    func valueTitle() {
        hideHighRedButton.setTitle("Högre", for: .normal)
        hideLowBlackButton.setTitle("Lägre", for: .normal)
    }
    
    
    func showFinalScore() {
        let alert = UIAlertController(title: "Korten är slut", message: game.getScore(), preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.game.reset()
            self.hideStartButton.isHidden = false
            self.setUpGame()
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func restartButton(_ sender: UIButton) {
        game.reset()
        hideStartButton.isHidden = false
        self.setUpGame()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
