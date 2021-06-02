//
//  ViewController.swift
//  Multiplication table九九乘法表
//
//  Created by Rose on 2021/5/27.
//

import UIKit

class ViewController: UIViewController {
    
    var index = 1
    var score = 0
    var num1 = 0
    var num2 = 0
    var answer = 0
    var options: [Int] = []
    var option1 = 0
    var option2 = 0
    var option3 = 0
    //按鈕圖
    var btnImage = ["button-1","button-2","button-3","button-4","button-5","button-6"]
    
    
    @IBOutlet weak var num1Label: UILabel!
    @IBOutlet weak var num2Label: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var itemNumber: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    // 顯示對錯
    @IBOutlet weak var wrongImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    
    //選擇題
    @IBOutlet var multiChoiceBtns: [UIButton]!
    
    //結算
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultScore: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var scoreImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        replay()
        itemNumber.text = "\(index)"
        resultView.isHidden = true
    }
    
    
//    @IBAction func next(_ sender: Any) {
//        index += 1
//        itemNumber.text = String(index)
//        randomQuestion()
//
//        wrongImage.isHidden = true
//        rightImage.isHidden = true
//        resultLabel.text = ""
//
//    }
    
    // 選擇答案
    @IBAction func selectAnswer(_ sender: UIButton) {
        index += 1
        itemNumber.text = "\(index)"
        wrongImage.isHidden = true
        rightImage.isHidden = true
        resultLabel.text = "\(score)"
            
        if sender.currentTitle == String(answer) {
            //score += 10
            rightChoices()
        } else {
            wrongChoices()
        }
        // 答滿10題
        if index == 11{
            index = 10
            resultView.isHidden = false
            resultScore.text = "\(score)"
            
            
            itemNumber.text = ""
            if score  == 0{
                resultDescriptionLabel.text = "!"
                scoreImage.image = UIImage(named: "0")
            }else if score <= 50 {
                resultDescriptionLabel.text = "💪 加油！再玩一次！"
                scoreImage.image = UIImage(named: "50")
            }
            else if score <= 70 {
                resultDescriptionLabel.text = "👍 做得很好！"
                scoreImage.image = UIImage(named: "70")
            }else if score <= 90 {
                resultDescriptionLabel.text = "💎 你太棒了！"
                scoreImage.image = UIImage(named: "90")
            }else{
                resultDescriptionLabel.text = "100！"
                scoreImage.image = UIImage(named: "100")
            }

        }
        // 隨機出題，清空資料
        randomQuestion()
        scoreLabel.text = "\(score)"
        print(num1,num2," = ",answer)
        
    }
    
    //再玩一次
    @IBAction func playAgain(_ sender: Any) {
        replay()
    }
    
    
    
    //隨機出題的 function
    func randomQuestion() {
        // 選擇題
        option1 = Int.random(in: 2...81)
        option2 = Int.random(in: 2...81)
        //option3 = Int.random(in: 2...81)
        options = [option1,option2]
        
        // num題目與answer答案
        num1 = Int.random(in: 2...9)
        num2 = Int.random(in: 2...9)
        answer = num1 * num2
        
        options.append(answer)
        options.shuffle()
        btnImage.shuffle()
       
        // 隨機出題與按鈕
        for i in 0...2 {
            multiChoiceBtns[i].setTitle(String(options[i]), for: .normal)
            multiChoiceBtns[i].setBackgroundImage(UIImage(named: btnImage[i]), for: .normal)
        }
        
        num1Label.text = String(num1)
        num2Label.text = String(num2)
        answerLabel.text = String(answer)
        print(options)
    }
    
    // 檢查答案-答對
    func rightChoices() {
        
        score += 10
        scoreLabel.text = "\(score)"
        resultLabel.text = "+10分"
        rightImage.isHidden = false
        wrongImage.isHidden = true
        resultLabel.textColor = UIColor.systemGreen
    }
    // 錯誤
    func wrongChoices(){
        resultLabel.text = "+0"
        resultLabel.textColor = .red
        rightImage.isHidden = true
        wrongImage.isHidden = false
    }
    
    // 再玩一次
    func replay() {
        index = 1
        score = 0
        randomQuestion()
        resultView.isHidden = true
        wrongImage.isHidden = true
        rightImage.isHidden = true
        resultLabel.text = ""
        resultDescriptionLabel.text = ""
        itemNumber.text = "\(index)"
        scoreLabel.text = "\(score)"
    }


}

