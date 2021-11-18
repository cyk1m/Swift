//
//  ViewController.swift
//  Day03
//
//  Created by apple on 2021/11/02.
//

import UIKit

class ViewController: UIViewController {
    //모든함수에서 사용하기 위해서 전역변수로 선언한 것
    var imgOn : UIImage? //?: nil허용
    var imgOff : UIImage?
    //버튼 토글 기능 할 변수
    var isZoom = false //nil허용하지 않을 것. ? 안 씀
    
    @IBOutlet var btnResize: UIButton!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png") //객체생성 해준 것
        imgView.image = imgOn
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale : CGFloat = 2 //시스템에 따라 유동적인 크기를 가지는 타입
        var newWidth : CGFloat = 0
        var newHeight : CGFloat = 0
        if isZoom{
            btnResize.setTitle("확대", for: .normal)
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
        }else{
            btnResize.setTitle("축소", for: .normal)
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
        }
        
        isZoom = !isZoom
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn { //입력값으로 들어간 스위치 온오프값
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
    }
    
}

