//
//  Page2Controller.swift
//  Day03
//
//  Created by apple on 2021/11/02.
//

import UIKit

class Page2Controller: UIViewController {
    
    @IBOutlet var imgView2: UIImageView!
    var current = 3
//    var img1 : UIImage?
//    var img2 : UIImage?
//    var img3 : UIImage?
//    var img4 : UIImage?
//    var img5 : UIImage?
//    var img6 : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        img1 = UIImage(named: "cake1.jpg")
        imgView2.image = UIImage(named: "cake3.jpg")
    }
    
    @IBAction func btnBack2(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func leftButton(_ sender: UIButton) {
        current = current - 1
        if current < 1 {
            current = 6
            let alert = UIAlertController(title: "안내", message: "왼쪽 끝입니다!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default){
              action in
            })
            self.present(alert, animated: true, completion: nil)
        }
        imgView2.image = UIImage(named: "cake" + String(current) + ".jpg")
        
    }
    @IBAction func rightButton(_ sender: UIButton) {
        current = current + 1
        if current > 6 {
            current = 1
            let alert = UIAlertController(title: "안내", message: "오른쪽 끝입니다!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default){
              action in
            })
            self.present(alert, animated: true, completion: nil)
        }
//        var imgResult = "cake" + String(current) + ".jpg"
        imgView2.image = UIImage(named: "cake" + String(current) + ".jpg")
        
    }
    
}
