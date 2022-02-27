import Foundation
import AVFoundation

struct AliasBrain {
    let chemistryWords  = ["Атом","Валентность", "Магний", "Вещество", "Водорорд", "Заряд", "Молекула"]
    let scienceWords  = ["Физика","Химия", "Доклад", "Тезис", "Диссертация", "Микроскоп", "Эксперимент"]
    let biologyWords  = ["Фотосинтез","Растение", "Хлорофилл", "Лист", "Клетка", "Соцветие", "Бактерия"]
    let physicsWords  = ["Металл","Материя", "Протон", "Давление", "Сопротивление", "Частицы", "Магнит"]
    let category = ["Химия", "Наука", "Биология", "Физика"]
    let specialWords = ["Валентность", "Диссертация","Фотосинтез","Протон"]
    
    var newArray = [String]()
    
    var score = 0
    var word = "Слово"
    var lastword = ""
    var player: AVAudioPlayer!
    
    // MARK: - update word
    mutating func updateWord(with category: String) -> String {
        switch category {
        case "Chemistry" : word = chemistryWords.randomElement()!
        case "Physics" : word = physicsWords.randomElement()!
        case "Biology" : word = biologyWords.randomElement()!
        case "Science" : word = scienceWords.randomElement()!
        default : return "no category"
        }
        if newArray.contains(word) == false {
            newArray.append(word)
            if let newword = newArray.last {
                lastword = newword
            }
        } else {
            if newArray.count < 7 {
                updateWord(with: category)
            }
            else {
                lastword = "Игра окончена вы набрали \(score) баллов"
                score = 0
                newArray = []
            }
        }
        return lastword
    }
    
    // MARK: - update score
    mutating func updateScore(title: String) -> Int {
        if (title == "ПРАВИЛЬНО")&&(newArray.isEmpty != true) {
            score += 1
            for i in specialWords {
                if word == i {
                    score += 4
                }
                audioPlayer(name: "G")
            }
        } else if (title == "ПРОПУСТИТЬ")&&(newArray.isEmpty != true) {
            score -= 1
            audioPlayer(name: "C")
        } else if title == "СБРОСИТЬ" {
            score = 0
            newArray = []
        }
        return score
    }
    
    // MARK: - audioPlayer
    mutating func audioPlayer (name sound : String){
        let url = Bundle.main.url(forResource: sound, withExtension:"wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
