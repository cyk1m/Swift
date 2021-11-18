//
//  ViewController.swift
//  Day04
//
//  Created by apple on 2021/11/03.
//

import UIKit

class ViewController: UIViewController {
    
    let interval = 1.0
    let timeSelector : Selector = #selector(ViewController.updateTime)
    var count = 0
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var underLabel: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
                //selector로 만들어서 넣어줘야 함...그래서 셀렉터 타입 변수를 13줄에 만들어 준것. #셀렉터 안에는 어떤 컨트롤러에 있고, 어떤함수인지 지정해주면 만들어 줌. 반드시 @objc 어노테이션이 붙어있어야함. 셀렉터 만들어주는 이유는..실행됐을때 확인해주는게 아니라 컴파일할 때 체크해줌. 안정성을 위해!!
            view.backgroundColor = UIColor.yellow
            let date = NSDate()
            print(date)
            var formatter = DateFormatter()
            formatter.dateFormat = "yy-MM-dd HH:mm EEE"
            topLabel.text = "현재시각: " + formatter.string(from: date as Date) //값이 Date타입이어야한다. date는 NSDate고 자식인 Date타입만 넣을 수 있어서 다운캐스팅 한 것임!!(as라는 키워드)
        }

    
    @objc func updateTime(){
        //line14 selector에 넣을 함수. for 안정성!
        //날짜, 시각 가져와서 위의 라벨, 현재시각 부분에 텍스트로 넣어줄 예정
        count = count + 1
        //topLabel.text = "현재시각: " + String(count)
        print("1초마다 내가 실행되어요@@@")
        //10초 후에 배경을 빨강으로 변경하세요!!
        if count == 10 {
            view.backgroundColor = UIColor.red
        }
        //15초 뒤에 경고창을 띄워보세요!
        if count == 15{
                    let alert = UIAlertController(title: "시간! 15초되었음.!", message: "집에 갑시다.!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default) { action in
                        print("15초 완료")
                       
                    })
                    self.present(alert, animated: true, completion: nil)
                }
                //20초후에 넘어가봅시다. page1으로!
                if count == 20{
                    guard let go = self.storyboard?.instantiateViewController(withIdentifier: "page1") else {return}

                       //화면 전환 애니메이션을 설정합니다. coverVertical 외에도 다양한 옵션이 있습니다.
                    go.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                       
                       //인자값으로 다음 뷰 컨트롤러를 넣고 present 메소드를 호출합니다.
                    self.present(go, animated: true)
                }
    }
    
    //데이터피커에 액션함수 걸기
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender //sender안에 내가 선택한 정보 들어 있음
        print(datePickerView.date) //2021-11-17 08:09:00 +0000. 스트링으로 캐스팅이 안 됨
//        underLabel.text = String(datePickerView.date)
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" //EEE는 요일
        underLabel.text = "선택시각: " + formatter.string(from: datePickerView.date)
    }
}

