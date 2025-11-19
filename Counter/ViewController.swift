//
//  ViewController.swift
//  Counter
//
//  Created by Андрей Грошев on 18.11.2025.
//

import UIKit

final class ViewController: UIViewController {
    private var counter: Int = 0
    private enum Action {
        case increment
        case decrement
        case eraser
        case zero
    }
    
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var infoTextView: UITextView!
    @IBOutlet weak private var counterTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterTextView.text = "История изменений:"
    }
    
    private func updateCounterLabel() -> Void {
        let prefix: String = counter == 0 ? "" : "Значение счётчика: "
        counterLabel.text = "\(prefix)\(counter)"
    }
    
    private func updateCounterTextView(action: Action) -> Void {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy, HH:mm"
        let currentDate = Date()
        let formattedDate = formatter.string(from: currentDate)
        
        var body: String
        
        switch action {
        case .increment:
            body = "значение изменено на +1"
        case .decrement:
            body = "значение изменено на -1"
        case .eraser:
            body = "значение сброшено"
        case .zero:
            body = "попытка уменьшить значение счётчика ниже 0"
        }
        
        counterTextView.text.append("\n[\(formattedDate)]: \(body)")
        if counterTextView.text.count > 0 {
            let location = counterTextView.text.count - 1
            let bottom = NSMakeRange(location, 1)
            counterTextView.scrollRangeToVisible(bottom)
        }
    }
    
    @IBAction private func buttonPlus(_ sender: Any) {
        counter += 1
        updateCounterLabel()
        let action: Action = .increment
        updateCounterTextView(action: action)
    }
    
    @IBAction private func buttonMinus(_ sender: Any) {
        var action: Action
        if counter > 0 {
            counter -= 1
            action = .decrement
        } else {
            action = .zero
        }
        updateCounterLabel()
        updateCounterTextView(action: action)
    }
    
    @IBAction private func buttonEraser(_ sender: Any) {
        counter = 0
        updateCounterLabel()
        let action: Action = .eraser
        updateCounterTextView(action: action)
    }
}
