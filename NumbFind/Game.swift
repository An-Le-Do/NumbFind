//
//  Game.swift
//  NumbFind
//
//  Created by Андрей Дорогой on 26.09.2023.
//

import Foundation

class game {
    
    struct item {
        var title: String
        var isFound: Bool = false
        var isError = false
    }
    
    private let data = Array (1...99)
    var items:[item] = []
    private var countItems: Int
    var nextItem:item?
    var status: statusGame = .start {
        didSet {
            if status != .start {
                stopGame()
            }
        }
    }
    private var timeForGame: Int
    private var secondsGame: Int {
        didSet {
            if secondsGame == 0 {
                status = .lose
            }
            updateTimer(status, secondsGame)
        }
    }
    private var timer: Timer?
    private var updateTimer: ((statusGame, Int) -> Void)
//    private var point: Int = 0
    
    init(countItems: Int, updateTimer:@escaping (_ _status: statusGame,_ _seconds:Int) -> Void) {
        self.countItems = countItems
        self.timeForGame = Settings.share.currentSettings.timeForGame
        self.secondsGame = self.timeForGame
        self.updateTimer = updateTimer
//        self.point = pointScore()
        setupGame()
    }
    
    private func setupGame() {
        var digits = data.shuffled()
        items.removeAll()
        while items.count < countItems{
            let item = item(title: String(digits.removeFirst()))
            items.append(item)
        }
       
        nextItem = items.shuffled().first
        updateTimer(status, secondsGame)
        
        if Settings.share.currentSettings.timeState {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in  ( )
                self.secondsGame -= 1
            })
        } 
    }
    
    func newGame() {
        status = .start
        self.secondsGame = self.timeForGame 
        setupGame()
    }
    
    func check(index: Int) {
        guard status == .start else {return}
        if items[index].title == nextItem?.title {
            items[index].isFound = true
            nextItem = items.shuffled().first(where: { (item) -> Bool in
                item.isFound == false
            })
        } else {
            items[index].isError = true
        }
        
        if nextItem == nil {
            status = .win
        }
    }
    
    func stopGame() {
        timer?.invalidate()
    }
    
//    private func pointScore() -> String {
//        let score = point + 1
//        return String(score)
//    }
    

}
extension Int {
        func secondsToString() -> String {
            let minutes = self / 60
            let seconds = self % 60
            return String (format: "%d:%02d", minutes, seconds)
        }
    }
