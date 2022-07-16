//
//  QuizViewController.swift
//  Quiz
//
//  Created by クワシマ・ユウキ on 2020/09/12.
//  Copyright © 2020 クワシマ・ユウキ. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray: [[String]] = []
    var correctAnswerCount = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizArray.append(["1+1", "1", "2", "3", "2"])
        quizArray.append(["3+4", "7", "1", "3", "1"])
        quizArray.append(["8+9", "1", "5", "17", "3"])
        quizArray.append(["9+2", "3", "2", "11", "3"])
        quizArray.append(["5-2", "2", "3", "4", "2"])
        quizArray.append(["8-3", "5", "1", "2", "1"])
        
        quizArray.shuffle()
        
        chooseQuiz()
        
        choiceButton1.addTarget(self, action: #selector(chooseAnswer(_:)), for: .touchUpInside)
        choiceButton2.addTarget(self, action: #selector(chooseAnswer(_:)), for: .touchUpInside)
        choiceButton3.addTarget(self, action: #selector(chooseAnswer(_:)), for: .touchUpInside)

    }
    
    func chooseQuiz(){
        let tempArray = quizArray[0]
        
        quizTextView.text = tempArray[0]
        
        choiceButton1.setTitle(tempArray[1], for: .normal)
        choiceButton2.setTitle(tempArray[2], for: .normal)
        choiceButton3.setTitle(tempArray[3], for: .normal)
    }
    
    func toNextSegue(){
        self.performSegue(withIdentifier: "toResult", sender: nil)
    }
    
    @objc func chooseAnswer(_ sender: UIButton){
        let tmpArray = quizArray[0]
        if Int(tmpArray[4]) == sender.tag{
            correctAnswerCount += 1
        }
        
        quizArray.remove(at: 0)
        
        if quizArray.count == 0{
            toNextSegue()
        } else {
            chooseQuiz()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult"{
            let resultVC = segue.destination as! ResultViewController
            resultVC.correctAnswer = self.correctAnswerCount
        }
    }
    
    

}
