//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet weak var resultIconLabel: UILabel!
    @IBOutlet weak var resultNameLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResult()
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func calculateResult() {
        guard let answers = answersChosen, !answers.isEmpty else { return }
        var animalCounts: [Animal: Int] = [:]
        for answer in answersChosen {
            let animal = answer.animal
            animalCounts[animal, default: 0] += 1
        }
        
        let sortedAnimals = animalCounts.sorted { $0.value > $1.value }
        
        if let mostFrequentAnimal = sortedAnimals.first?.key {
            displayResult(for: mostFrequentAnimal)
        }
    }
    
    private func displayResult(for animal: Animal) {
        resultIconLabel.text = "Вы - \(animal.rawValue)!"
        resultNameLabel.text = "Вы \(animal.russianAnimalName)"
        resultDefinitionLabel.text = "\(animal.definition)"
            
        }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
