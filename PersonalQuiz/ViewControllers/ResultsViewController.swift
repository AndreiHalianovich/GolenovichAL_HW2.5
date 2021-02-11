//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 08.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var answersChoosen: [Answer]?
    
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        guard  let answersChoosen = answersChoosen else { return }
        showResult(for: answersChoosen)
    }
}

extension ResultsViewController {
    private func showResult(for answers: [Answer]) {
        
        /* Данный код нашел в интернете и, признаюсь честно, не до конца понимаю как он работает.
         
         Думаю, что нужно сделать Dictionary с ключами из ответов, а значения для этих ключей устновить 0 (ноль),
         а затем перебрать через for-in массив - если ключ словаря совпадает с элементом массива, то к значению словаря добавлять +1. Потом перебрать словарь и найти наибольшее значение. Но не получилось пока это реализовать.
        */
        
        let answerDict = Dictionary(grouping: answers ){ $0.type}.mapValues {$0.count}
        let answerDictSorting = answerDict.sorted(by: {$0.value > $1.value})
        guard let answer = answerDictSorting.first?.key else { return }
        emojiLabel.text = "Вы - \(answer.rawValue)"
        definitionLabel.text = answer.definition
    }
}
