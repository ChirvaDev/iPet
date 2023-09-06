//
//  PetModel.swift
//  iPet
//
//  Created by Pro on 06.07.2023.
//

import Foundation

struct Pet: Codable {
    var name: String
    var birthday = Date()
    var lastMeal: Date
    var lastDrink: Date
    var maxAge: Int = 10000
    var age: Int {
        let timeSince = calculateTimeSince(data: birthday)
        return timeSince % maxAge
    }
    
    var happinessLevel: String {
        hunger == "Hungry" || thirst == "Thirsty" ? "Unhappy 🙈" : "Happy ✨"
    }
    
    var hunger: String {
        let timeSince = calculateTimeSince(data: lastMeal)
        var string = ""
        
        switch timeSince {
        case 0..<15: string = "Satiated ✅"
        case 15..<25: string = "Getting hungry..."
        case 25...: string = "Hungry"
        default: string = "mmrrrrr..."
        }
        return string
    }
    
    var thirst: String {
        let timeSince = calculateTimeSince(data: lastDrink)
        var string = ""
        
        switch timeSince {
        case 0..<15: string = "Satiated ✅"
        case 15..<25: string = "Getting thirsty..."
        case 25...: string = "Thirsty"
        default: string = "mmrrrrr..."
        }
        return string
    }
}
