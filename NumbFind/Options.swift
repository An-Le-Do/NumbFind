//
//  Options.swift
//  NumbFind
//
//  Created by Андрей Дорогой on 23.10.2023.
//

import Foundation

enum keysUserDefaults{
     static let settingsGame = "settingsGame"
}

struct SettingsGame: Codable {
    var timeState: Bool 
    var timeForGame: Int
}

class Settings {
    static var share = Settings()
    private let defaultSettings = SettingsGame(timeState: true, timeForGame: 30)
    var currentSettings: SettingsGame {
        get {
            if let data = UserDefaults.standard.object(forKey: keysUserDefaults.settingsGame) as? Data{
                return try! PropertyListDecoder().decode(SettingsGame.self, from: data)
            } else {
                if let data = try? PropertyListEncoder().encode(defaultSettings) {
                    UserDefaults.standard.setValue(data, forKey: keysUserDefaults.settingsGame)
                }
                return defaultSettings
            }
        }
        set {
//            do {
//                let data = try PropertyListEncoder().encode(newValue)
//            } catch {
//                print (error)
//            }
            if let data = try? PropertyListEncoder().encode(newValue) {
                UserDefaults.standard.setValue(data, forKey: keysUserDefaults.settingsGame)
            }

        }
    }
    
    func resetSettings() {
         currentSettings = defaultSettings
    }
}
