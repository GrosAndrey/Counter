//
//  ViewController.swift
//  Counter
//
//  Created by Андрей Грошев on 18.11.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonDidTap(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
}

