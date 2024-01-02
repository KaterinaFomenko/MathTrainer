//
//  TrainViewController.swift
//  MathTrainerlesson_2
//
//  Created by Katerina on 11/11/2023.
//
// Train revert commit 
import Foundation
import UIKit


final class TrainViewController: UIViewController {
    @IBOutlet var backButton: UIButton!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var answerOneButton: UIButton!
    @IBOutlet var answerTwoButton: UIButton!

    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var viewCountLabel: UIView! // ??

    // MARK: - Properties
    var type: MathTypes = .add {
        didSet {
             switch type {
                       case .add:
                           sign = "+"
                       case .divide:
                           sign = "÷"
                       case .multiply:
                           sign = "×"
                       case.subtract:
                           sign = "-"
                       }
                   }
               }
    private var firstNumber = 0
    private var secondNumber = 0
    private var firstNumberMult = 0
    private var secondNumberMult = 0
    private var firstNumberDivide = 0
    private var secondNumberDivide = 0
    
    private var sign = ""
    
    private var count = 0 {
        didSet {
            configureLabel()
        }
    }
 
    var answer: Int {
        switch type {
        case .add:
            return firstNumber + secondNumber
        case .divide:
            return firstNumberDivide / secondNumberDivide
        case .multiply:
            return firstNumberMult * secondNumberMult
        case .subtract:
            return firstNumber - secondNumber
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        configureQuestion()
        configureButton()
        configureLabel()
    }
    
    // MARK: - IBActions
    
    @IBAction func leftActions(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    @IBAction func rightAction(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    
    @IBAction private func incrementCountButtonTapped(_ sender: UIButton) {
        count += 1
    }
    
    
    // MARK:- Methods
    private func configureQuestion() {
            firstNumber = Int.random(in: 1...99)
            secondNumber = Int.random(in: 1...99)
            firstNumberMult = Int.random(in: 1...10)
            secondNumberMult = Int.random(in: 1...10)
            secondNumberDivide = Int.random(in: 1...10)
            let answerDiv = Int.random(in: 1...10)
            firstNumberDivide = answerDiv * secondNumberDivide
            
        switch sign {
        case "×":
            let question = "\(firstNumberMult) \(sign) \(secondNumberMult) ="
                questionLabel.text = question
        case "÷":
            let question = "\(firstNumberDivide) \(sign) \(secondNumberDivide) ="
                questionLabel.text = question
        default:
            let question = "\(firstNumber) \(sign) \(secondNumber) ="
                questionLabel.text = question
        }
    }
    
    func configureLabel() {
        configureLabelStyle(label: countLabel)
        countLabel.text = "\(count)"
    }
    
    func configureButton() {
        configureButtonStyle(button: backButton)
        configureButtonStyle(button: answerOneButton, cornerRadius: answerOneButton.frame.width / 2.0)
        configureButtonStyle(button: answerTwoButton, cornerRadius: answerOneButton.frame.width / 2.0)
        
        let isRightButton = Bool.random()
        var randomAnswer: Int
        var limit = 10
        if sign == "÷" {
            limit = 5
        }
        repeat {
            randomAnswer = Int.random(in: (answer - limit)...(answer + limit))
        } while randomAnswer == answer
        
        answerOneButton.setTitle(isRightButton ? String(answer) : String(randomAnswer), for: .normal)
        answerTwoButton.setTitle(isRightButton ? String(randomAnswer) : String(answer), for: .normal)
    }
    
    func configureButtonStyle(button: UIButton, cornerRadius: CGFloat = 5) {
        button.backgroundColor = .systemYellow
        // Add shadow
        button.layer.cornerRadius = CGFloat(cornerRadius)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 3
    }
    
    func configureLabelStyle(label: UILabel) {
        label.layer.cornerRadius = CGFloat(15)
        label.layer.masksToBounds = true

        // Add shadow
        label.layer.shadowColor = UIColor.darkGray.cgColor
        label.layer.shadowPath = UIBezierPath(roundedRect: label.bounds, cornerRadius: label.layer.cornerRadius).cgPath
        label.layer.shadowOffset = CGSize(width: 0, height: 2)
        label.layer.shadowOpacity = 0.6
        label.layer.shadowRadius = 3
    }
    
    private func check(answer: String, for button: UIButton) {
        let isRightAnswer = Int(answer) == self.answer
        button.backgroundColor = isRightAnswer ? .green : .red
        
        if isRightAnswer {
            let isSecondAttend = answerOneButton.backgroundColor == .red || answerTwoButton.backgroundColor == .red
            count += isSecondAttend ? 0 : 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                [weak self] in
                self?.configureQuestion()
                self?.configureButton()
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "unwindSegueToVC":
            if let vc = segue.destination as? ViewController {
                switch type {
                case .add: vc.plusCounter = count
                case .divide: vc.divCounter = count
                case .multiply: vc.multCounter = count
                case .subtract: vc.minusCounter = count
                }
            }
        default:
            print("There are is no logic for segue by this id")
        }
    }
}

