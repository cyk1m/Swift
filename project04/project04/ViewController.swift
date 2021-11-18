//
//  ViewController.swift
//  project04
//
//  Created by apple on 2021/11/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btnNum1: UIButton!
    @IBOutlet var btnNum2: UIButton!
    @IBOutlet var lblLevel: UILabel!
    @IBOutlet var lblCount: UILabel!
    
    var quizNum1: [String] = ["나 정말 박박억울해.", "초밥 짜짜 좋다!", "방방봐(방송은 방송으로만 보세요)", "오하운(오늘 하루 운이 없다)", "랜친살안(랜선 친구와 함께 운동해도 살은 안 빠진다.)"] //보기1
    var quizNum2: [String] = ["널 정말 박박좋아해.", "음식 맛이 짜짜", "방방봐(바밤바를 귀엽게 말함)", "오하운(오늘 하루 운동)", "랜친살안(랜상에서는 친하지만 실제 오프라인 만남에서는 안 친하거나 어색한 사이"] //보기2
    var answer: [Int] = [1, 1, 1, 2, 2] //정답 배열
    var yourAnswer: Int = 0
    var level : Int = 1 //문제 인덱스
    var count : Int = 5 //남은 문제 카운트
    var old : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---------------------")
        lblLevel.text = String(level)
        self.btnNum1.setTitle(quizNum1[0], for: .normal)
        self.btnNum2.setTitle(quizNum2[0], for: .normal)
        lblCount.text = String(count)
        
    }

    @IBAction func num1Act(_ sender: UIButton) {
        yourAnswer = 1
        print("test--222")
        for i in 0..<answer.count {
        
        if yourAnswer == answer[i] { //정답일 때
            let alert = UIAlertController(title: "당신의 선택은", message: "정답입니다!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default){
            action in
                self.next()
            })
            self.present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "당신의 선택은", message: "오답입니다!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default){
            action in
                self.next()
            })
            self.present(alert, animated: true, completion: nil)
            old = old + 1
        }

    }
    }
    
    @IBAction func num2Act(_ sender: UIButton) {
        print("test--1")
        yourAnswer = 2
        for i in 0..<answer.count {
        if yourAnswer == answer[i] { //정답일 때
            print("test--1--1")
            let alert = UIAlertController(title: "당신의 선택은", message: "정답입니다!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default){
            action in
                self.next()
            })
            self.present(alert, animated: true, completion: nil)
        }else{
            print("test--1--2")
            let alert = UIAlertController(title: "당신의 선택은", message: "오답입니다!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default){
            action in
                self.next()
            })
            self.present(alert, animated: true, completion: nil)
            old = old + 1
        }
        }
    }
    
    func next (){
        level = level + 1
        lblLevel.text = String(level) //문제 인덱스++
//        print(level)
        
        count = count - 1
//        print(quizNum1[level])
        if level < 5 {
            self.btnNum1.setTitle(quizNum1[level], for: .normal)
            self.btnNum2.setTitle(quizNum2[level], for: .normal)
            if count >= 0 {
                lblCount.text = String(count) //남은 문제수 줄이기
            } else if count < 0{ //문제 다 풀면 결과 페이지로 이동
//                guard let go = self.storyboard?.instantiateViewController(withIdentifier:"page2") as? Page2Controller else {return}
//                //3개 이상 오답이면 old, 아니면 young 이미지 띄우기
//                if old >= 3 {
//                    go.img = "old.jpg"
//                } else {
//                    go.img = "young.jpg"
//                }
//                self.present(go, animated: true)
            }
        }else{
            print("문제 끝!")
            guard let go = self.storyboard?.instantiateViewController(withIdentifier:"page2") as? Page2Controller else {return}
            //3개 이상 오답이면 old, 아니면 young 이미지 띄우기
            if old >= 3 {
                go.img = "old.jpg"
            } else {
                go.img = "young.jpg"
            }
            self.present(go, animated: true)
        }
//            self.btnNum1.setTitle(quizNum1[level], for: .normal)
//            self.btnNum2.setTitle(quizNum2[level], for: .normal)
//        count = count - 1
//        if count >= 0 {
//            lblCount.text = String(count) //남은 문제수 줄이기
//        } else if count < 0{ //문제 다 풀면 결과 페이지로 이동
//            guard let go = self.storyboard?.instantiateViewController(withIdentifier:"page2") as? Page2Controller else {return}
//            //3개 이상 오답이면 old, 아니면 young 이미지 띄우기
//            if old >= 3 {
//                go.img = "old.jpg"
//            } else {
//                go.img = "young.jpg"
//            }
//            self.present(go, animated: true)
//        }
        
    }
    
}


