//
//  ViewController.swift
//  Alert
//
//  Created by 서희찬 on 2022/02/20.
//

import UIKit

class ViewController: UIViewController {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true // 전부 온오프여부
    
    
    @IBOutlet var lampImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
        
    }

    //켜기
    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn==true){ //전구가 켜져이씀
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 ON 상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: nil) //별동작 안할시 handler nill
            
            lampOnAlert.addAction(onAction)
            
            //present 메서드 실행
            present(lampOnAlert, animated: true, completion: nil)
        }else{ //전구가 꺼져이씀
            lampImg.image = imgOn
            isLampOn = true
            
        }
    }
    
    //끄기
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn{
            let lampOffAlert = UIAlertController(title: "off lamp", message: "off?", preferredStyle: UIAlertController.Style.alert)
            
            let OffAction = UIAlertAction(title: "yes", style: UIAlertAction.Style.default, handler: {
                ACTION in self.lampImg.image = self.imgOff //익명함수
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
            lampOffAlert.addAction(OffAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert,animated: true,completion: nil)
        }
    }
    //제거
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "remove Lamp", message: "Remove?", preferredStyle: UIAlertController.Style.alert)
        
        let OffAction = UIAlertAction(title: "no,OFF", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "no,ON", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        let removeAciton = UIAlertAction(title: "yes,REMOVE", style: UIAlertAction.Style.destructive, handler: {
            ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        lampRemoveAlert.addAction(OffAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAciton)
        present(lampRemoveAlert, animated: true, completion: nil)
        
        
    }
    
    
}

