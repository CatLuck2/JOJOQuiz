//
//  ViewController.swift
//  JOJOQuiz
//
//  Created by 藤澤洋佑 on 2018/08/27.
//  Copyright © 2018年 Fujisawa-Yousuke. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //音楽プレイヤーを生成
    var TapBGMPlayer = AVAudioPlayer()
    
    //出題bgmのパスを設定
    let TapBGMPath = Bundle.main.bundleURL.appendingPathComponent("出題.mp3")

    @IBOutlet weak var QuestionLabel: UILabel!
    
    //問題1
    @IBAction func Question1(_ sender: Any) {
        //出題音を再生
        playTapBGM()
        //出題文を設定
        question = "空城承太郎のセリフはどれ？"
        //出題文に関連した選択肢と答えを設定
        substitution()
        //回答画面へと遷移
        performSegue(withIdentifier: "goQuestion", sender: self)
    }
    
    //問題2
    @IBAction func Question2(_ sender: Any) {
        playTapBGM()
        question = "ディオは人間を辞めて何になった？"
        substitution()
        performSegue(withIdentifier: "goQuestion", sender: self)
    }
    
    //問題3
    @IBAction func Question3(_ sender: Any) {
        playTapBGM()
        question = "「ザ・ワールド」で有名なのは？"
        substitution()
        performSegue(withIdentifier: "goQuestion", sender: self)
    }
    
    //問題文と選択肢と解答番号用意
    var question = ""
    var choice1 = ""
    var choice2 = ""
    var choice3 = ""
    var answer_num = 1
    
    //選択した問題別に、答えと選択肢を設定
    func substitution() {
        switch question {
        case "空城承太郎のセリフはどれ？":
            answer_num = 3
            choice1 = "レロレロレロレロ"
            choice2 = "無駄無駄無駄無駄無駄無駄ァ!"
            choice3 = "てめーは俺を怒らせた"
        case "ディオは人間を辞めて何になった？":
            answer_num = 1
            choice1 = "吸血鬼"
            choice2 = "神様"
            choice3 = "悪魔"
        case "「ザ・ワールド」で有名なのは？":
            answer_num = 2
            choice1 = "ジョナサン"
            choice2 = "DIO"
            choice3 = "花京院"
        default: break
        }
    }
    
    //音楽プレイヤーを再生する処理
    func playTapBGM() {
        do {
            //出題bgmプレイヤー用に音源ファイル名を指定
            TapBGMPlayer = try AVAudioPlayer(contentsOf: TapBGMPath, fileTypeHint: nil)
            //ループしない
            TapBGMPlayer.numberOfLoops = 0
            //再生
            TapBGMPlayer.play()
        } catch {
            print("エラーが発生しました")
        }
    }
    
    //格納した要素をChoiceViewControllerに渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //回答画面へと遷移する際の処理
        if segue.identifier == "goQuestion" {
            //回答画面のインスタンスを生成
            let choice_instance = segue.destination as! ChoiceViewController
            choice_instance.questionLabel = question
            choice_instance.choice_label1 = choice1
            choice_instance.choice_label2 = choice2
            choice_instance.choice_label3 = choice3
            choice_instance.answer_number = answer_num
        }
    }
    
}

