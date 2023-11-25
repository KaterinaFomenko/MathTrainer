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
    @IBOutlet var labelAdd: UILabel!
    @IBOutlet var labelMult: UILabel!
    @IBOutlet var labelMinus: UILabel!
    @IBOutlet var labelDiv: UILabel!
    
    // MARK: - Prpperties
    private var selectedType: MathTypes = .add
    var plusCounter: Int = 0
    var minusCounter: Int = 0
    var divCounter: Int = 0
    var multCounter: Int = 0
        
    // MARK: - Life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        updateCountLabel()
    }
    
    // MARK: - Actions
    @IBAction func buttonsActions(_ sender: UIButton) {
        // стучим к-го типа кнопка была нажата(по тегу)
        selectedType = MathTypes(rawValue: sender.tag) ?? .add
        performSegue(withIdentifier: "goToNext", sender: sender)
    }
    
    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {
        updateCountLabel()
    }
    
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
    
    func updateCountLabel() {
        labelAdd.text = String(plusCounter)
        labelMult.text = String(multCounter)
        labelMinus.text = String(minusCounter)
        labelDiv.text = String(divCounter)
    }
}

