//
//  ViewController.swift
//  Counter
//
//  Created by Андрей Грошев on 18.11.2025.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var infoTextView: UITextView!
    @IBOutlet weak var counterTextView: UITextView!
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterTextView.text = "История изменений:"
    }

    @IBAction func buttonPlus(_ sender: Any) {
        counter += 1
        updateCounterLabel()
        updateCounterTextView()
    }
    
    @IBAction func buttonMinus(_ sender: Any) {
        if counter > 0 {
            counter -= 1
        }
        updateCounterLabel()
        updateCounterTextView()
    }
    
    @IBAction func buttonEraser(_ sender: Any) {
        counter = 0
        updateCounterLabel()
    }
    
    private func updateCounterLabel() {
        let prefix: String = counter == 0 ? "" : "Значение счётчика: "
        counterLabel.text = "\(prefix)\(counter)"
    }
    
    private func updateCounterTextView() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy, HH:mm"
        let currentDate = Date()
        let formattedDate = formatter.string(from: currentDate)
        
        let body = "значение изменено на"
        
        counterTextView.text.append("\n[\(formattedDate)] \(body) \(counter)")
    }
}

