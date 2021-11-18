//
//  Page3Controller.swift
//  Day03
//
//  Created by apple on 2021/11/02.
//

import UIKit

class Page3Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btnBack3(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func btnImg1(_ sender: UIButton) {
        guard let go = self.storyboard?.instantiateViewController(withIdentifier:"page4") as? Page4Controller else {return}
        go.img = "1.png"
        self.present(go, animated: true)
    }
    @IBAction func btnImg2(_ sender: UIButton) {
        guard let go = self.storyboard?.instantiateViewController(withIdentifier:"page4") as? Page4Controller else {return}
        go.img = "2.png"
        self.present(go, animated: true)
    }
    @IBAction func btnImg3(_ sender: UIButton) {
        guard let go = self.storyboard?.instantiateViewController(withIdentifier:"page4") as? Page4Controller else {return}
        go.img = "3.png"
        self.present(go, animated: true)
    }
    @IBAction func btnImg4(_ sender: UIButton) {
        guard let go = self.storyboard?.instantiateViewController(withIdentifier:"page4") as? Page4Controller else {return}
        go.img = "4.png"
        self.present(go, animated: true)
    }
    @IBAction func btnImg5(_ sender: UIButton) {
        guard let go = self.storyboard?.instantiateViewController(withIdentifier:"page4") as? Page4Controller else {return}
        go.img = "5.png"
        self.present(go, animated: true)
    }
    @IBAction func btnImg6(_ sender: UIButton) {
        guard let go = self.storyboard?.instantiateViewController(withIdentifier:"page4") as? Page4Controller else {return}
        go.img = "6.png"
        self.present(go, animated: true)
    }
    
}
