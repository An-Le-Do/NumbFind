//
//  GameViewController.swift
//  NumbFind
//
//  Created by Андрей Дорогой on 25.09.2023.
//

import UIKit

enum statusGame{
    case start
    case win
    case lose
}

class GameViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var nextDigit: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var newGame: UIButton!
    //    @IBOutlet weak var Points: UILabel!
    
    lazy var  Game = game(countItems: buttons.count) { [weak self] (status, time) in
        guard let self = self else {return}
        if Settings.share.currentSettings.timeState == false {
            self.timerLabel.isHidden = true
        }
        self.timerLabel.text = time.secondsToString()
        self.updateInfoGame(with: status)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Game.stopGame()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(view)
     setupScreen()
    }
    
    @IBAction func pressOneButton(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else {return}
        Game.check(index:buttonIndex)
        updateUI()
//        sender.isHi .tag)
    }
    
    @IBAction func newGameButton(_ sender: UIButton) {
        Game.newGame()
        sender.isHidden = true
        setupScreen()
    }
    func setupScreen() {
        for index in Game.items.indices {
            buttons[index].setTitle(Game.items[index].title, for: .normal )
//            buttons[index].isHidden = false
            buttons[index].alpha = 1
            buttons[index].isEnabled = true
        }
        nextDigit.text = Game.nextItem?.title
    }
    
    private func updateUI() {
        for index in Game.items.indices {
//            buttons[index].isHidden = Game.items[index].isFound
            buttons[index].alpha = Game.items[index].isFound ? 0:1
            buttons[index].isEnabled = !Game.items[index].isFound
            
            if Game.items[index].isError {
                UIView.animate(withDuration: 0.3) {
                    self.buttons[index].backgroundColor = .red
                    self.buttons[index].layer.cornerRadius = 25

                } completion: { _ in
                    self.buttons[index].backgroundColor = .systemGray5
                    self.Game.items[index].isError = false
                }
            }
        }
        nextDigit.text = Game.nextItem?.title
        
//        if Game.status == .win {
            updateInfoGame(with: Game.status)
    }
    
    private func updateInfoGame(with status: statusGame) {
        switch status {
        case .start:
            statusLabel.text = "Let begin!"
            newGame.isHidden = true
            nextDigit.isHidden = false
        case .win:
            statusLabel.text = "You are WIN"
            newGame.isHidden = false
            nextDigit.isHidden = true
        case .lose:
            statusLabel.text = "You are LOSE"
            newGame.isHidden = false
            nextDigit.isHidden = true
        }
    }
}
