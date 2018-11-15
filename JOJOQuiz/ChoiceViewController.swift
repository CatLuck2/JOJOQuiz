//
//  ChoiceViewController.swift
//  JOJOQuiz
//
//  Created by 藤澤洋佑 on 2018/08/28.
//  Copyright © 2018年 Fujisawa-Yousuke. All rights reserved.
//

import UIKit
import AVFoundation

class ChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //選択した問題の出題文を表示
        Question_Label.text = questionLabel
        //ボタンに選択肢の文字を代入
        Choice1.setTitle(choice_label1, for: .normal)
        Choice2.setTitle(choice_label2, for: .normal)
        Choice3.setTitle(choice_label3, for: .normal)
        //正解/不正解を示すLabelはタップされるまで非表示
        AnswerResult.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //前画面から値を受け取るための変数
    var questionLabel = ""
    var choice_label1 = ""
    var choice_label2 = ""
    var choice_label3 = ""
    var answer_number = 0
    
    //正解不正解のbgmプレイヤーを生成
    var resultBGMPlayer = AVAudioPlayer()
    //正解bgmのパス
    let correctBGMPath = Bundle.main.bundleURL.appendingPathComponent("正解.mp3")
    //不正解BGMのパス
    let incorrectBGMPath = Bundle.main.bundleURL.appendingPathComponent("不正解.mp3")
    
    //正解のBGMを再生する
    func correctBGMPlay() {
        do {
            resultBGMPlayer = try AVAudioPlayer(contentsOf: correctBGMPath, fileTypeHint: nil)
            resultBGMPlayer.numberOfLoops = 0
            resultBGMPlayer.play()
        } catch {
            print("エラーが発生しました")
        }
    }
    
    //不正解のBGMを再生する
    func incorrectBGMPlay() {
        do {
            resultBGMPlayer = try AVAudioPlayer(contentsOf: incorrectBGMPath, fileTypeHint: nil)
            resultBGMPlayer.numberOfLoops = 0
            resultBGMPlayer.play()
        } catch {
            print("エラーが発生しました")
        }
    }
    
    //問題文
    @IBOutlet weak var Question_Label: UILabel!
    
    //選択肢1
    @IBOutlet weak var Choice1: UIButton!
    
    //選択肢2
    @IBOutlet weak var Choice2: UIButton!
    
    //選択肢3
    @IBOutlet weak var Choice3: UIButton!
    
    //正解/不正解
    @IBOutlet weak var AnswerResult: UILabel!
    
    //選択肢1がタップされた場合
    @IBAction func Choice1Button(_ sender: Any) {
        //タップすると結果を表示するLabelを表示
        AnswerResult.isHidden = false
        //問題の答えが選択肢1の場合
        if answer_number == 1 {
            correctBGMPlay()
            //正解と表示
            AnswerResult.text = "正解!!"
        //問題の答えが選択肢1でない場合
        } else {
            incorrectBGMPlay()
            AnswerResult.text = "不正解.."
        }
    }
    
    @IBAction func Choice2Button(_ sender: Any) {
        AnswerResult.isHidden = false
        if answer_number == 2 {
            correctBGMPlay()
            AnswerResult.text = "正解!!"
        } else {
            incorrectBGMPlay()
            AnswerResult.text = "不正解.."
        }
    }
    
    @IBAction func Choice3Button(_ sender: Any) {
        AnswerResult.isHidden = false
        if answer_number == 3 {
            correctBGMPlay()
            AnswerResult.text = "正解!!"
        } else {
            incorrectBGMPlay()
            AnswerResult.text = "不正解.."
        }
    }
    
    
}
