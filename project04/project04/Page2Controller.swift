//
//  Page2Controller.swift
//  project04
//
//  Created by apple on 2021/11/04.
//

import UIKit

class Page2Controller: UIViewController {
    
    var img = ""
    @IBOutlet var imgResult: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgResult.image = UIImage(named: img)

    }
    


}
