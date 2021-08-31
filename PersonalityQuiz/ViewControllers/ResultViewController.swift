//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var whoYouLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    var answersChosen: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        result()
    }
}

// MARK: - Counting logic

extension ResultViewController {
    private func result() {
        let animal = counting(in: answersChosen)
        switch animal {
            case .dog:
                whoYouLabel.text = "Вы - \(animal.rawValue)!"
                descriptionLabel.text = animal.definition
            case .cat:
                whoYouLabel.text = "Вы - \(animal.rawValue)!"
                descriptionLabel.text = animal.definition
            case .rabbit:
                whoYouLabel.text = "Вы - \(animal.rawValue)!"
                descriptionLabel.text = animal.definition
            case .turtle:
                whoYouLabel.text = "Вы - \(animal.rawValue)!"
                descriptionLabel.text = animal.definition
        }
    }

    private func counting(in answers: [Answer]) -> Animal {
        var animalsOfAnswers: [Animal] = []
        for answer in answers {
            animalsOfAnswers.append(answer.animal)
        }

        let animals = Array(Set(animalsOfAnswers))
        var animalYou: Animal = .dog
        var maxRepeat = 0

        for animal in animals {
            let count = animalsOfAnswers.filter { $0 == animal }.count
            if count > maxRepeat {
                maxRepeat = count
                animalYou = animal
            }
        }
        return animalYou
    }
}
