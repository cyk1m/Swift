//
//  DetailViewController.swift
//  Day66
//
//  Created by Alicia Lim on 2021/11/10.
//

import UIKit

class DetailViewController: UIViewController {
    var receiveItem = ""
    var receiveItemImageFile = ""
    
    @IBOutlet var lblItem: UILabel!
    @IBOutlet var imgeFile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblItem.text = receiveItem
        imgeFile.image = UIImage(named: receiveItemImageFile)
        // Do any additional setup after loading the view.
    }
    
    func receiveItem(_ item: String,
                     _ fileName: String)  {
        receiveItem = item
        receiveItemImageFile = fileName
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
