//
//  AliasBrain.swift
//  AliasApp
//
//  Created by Inna Kokorina on 24.02.2022.
//

import Foundation

struct AliasBrain {
    
    let chemistryWords  = ["Атом","Валентность", "Магний", "Вещество", "Водорорд", "Заряд", "Молекула"]
    let scienceWords  = ["Физика","Химия", "Доклад", "Тезис", "Диссертация", "Микроскоп", "Эксперимент"]
    let biologyWords  = ["Фотосинтез","Рсатение", "Хлорфил", "Лист", "Клетка", "Соцветие", "Бактерия"]
    let physicsWords  = ["Металл","Материя", "Протон", "Давление", "Сопротивление", "Частицы", "Магнит"]
    let category = ["Химия", "Наука", "Биология", "Физика"]
    let specialWords = ["Валентность", "Диссертация","Фотосинтез","Протон"]
    
    
    var score = 0
    var word = ""
    
    // MARK: - update word
    
    mutating func updateWord(with category: String) -> String {
        switch category {
        case "Chemistry" : word = chemistryWords.randomElement()!
        case "Physics" : word = physicsWords.randomElement()!
        case "Biology" : word = biologyWords.randomElement()!
        case "Science" : word = scienceWords.randomElement()!
        default : return "no category"
        }
        return word
    }
    
    // MARK: - update score
    mutating func updateScore(title: String) -> Int {
        if title == "Правильно" {
            score += 1
            for i in specialWords {
                if word == i {
                    score += 4
                }
            }
        } else if title == "Пропустить" {
            score -= 1
        } else if title == "Сбросить" {
            score = 0
        }
        return score
    }
}
