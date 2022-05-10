//
//  ViewController.swift
//  Magic 8Ball
//
//  Created by 서희찬 on 2022/05/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aksImg: UIImageView!

    @IBAction func askBtn(_ sender: UIButton) {
        
        let askArr = [ #imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball3")]
        
        aksImg.image = askArr.randomElement()
        
    }
    
}

