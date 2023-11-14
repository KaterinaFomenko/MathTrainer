//
//  TrainViewController.swift
//  MathTrainerlesson_2
//
//  Created by Katerina on 11/11/2023.
//

import Foundation
import UIKit


final class TrainViewController: UIViewController {
    @IBOutlet var backButton: UIButton!
    @IBOutlet var answerOneButton: UIButton!
    @IBOutlet var answerTwoButton: UIButton!
    
    // MARK: - Properties
    var type: MathTypes = .add {
        didSet {
            print(type)
        }
    }
    
    override func viewDidLoad() {
        configureButton(button: backButton)
        configureButton(button: answerOneButton, cornerRadius: answerOneButton.frame.width / 2.0)
        configureButton(button: answerTwoButton, cornerRadius: answerOneButton.frame.width / 2.0)
    }
    
    func configureButton(button: UIButton, cornerRadius: CGFloat = 5) {
        button.layer.cornerRadius = CGFloat(cornerRadius)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 3
    }
}
