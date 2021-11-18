//
//  Page4Controller.swift
//  Day03
//
//  Created by apple on 2021/11/02.
//

import UIKit

class Page4Controller: UIViewController {
    
    @IBOutlet var imageView3: UIImageView!
    var img = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView3.image = UIImage(named: img)
    }
    
    @IBAction func btnBack4(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
