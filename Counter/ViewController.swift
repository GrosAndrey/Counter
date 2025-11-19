//
//  ViewController.swift
//  Counter
//
//  Created by Андрей Грошев on 18.11.2025.
//

import UIKit

class ViewController: UIViewController {
    private var counter: Int = 0
    
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var incrementButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func buttonDidTap(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
    }
}
