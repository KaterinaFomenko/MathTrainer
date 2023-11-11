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
    
}
