//
//  ViewController.swift
//  MathTrainerlesson_2
//
//  Created by Katerina on 09/11/2023.
//

import UIKit

enum MathTypes: Int {
    case add, subtract, multiply, divide
}

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet var buttonsCollection: [UIButton]!
    
    // MARK: - Prpperties
    private var selectedType: MathTypes = .add
    
    // MARK: - Life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureButtons()
    }
    
    // MARK: - Actions
    @IBAction func buttonsActions(_ sender: UIButton) {
        // стучим к-го типа кнопка была нажата(по тегу)
        selectedType = MathTypes(rawValue: sender.tag) ?? .add
        performSegue(withIdentifier: "goToNext", sender: sender)
    }
    
    @IBAction func unwind(unwindSegue: UIStoryboardSegue) { }
    
    // MARK: - Methods
    // Подготавливаем к передачи
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? TrainViewController {
            viewController.type = selectedType
        }
    }
    private func configureButtons() {
        // Add shadow
        buttonsCollection.forEach { button in
            button.layer.shadowColor = UIColor.darkGray.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowOpacity = 0.6
            button.layer.shadowRadius = 3
            
        }
    }
}

