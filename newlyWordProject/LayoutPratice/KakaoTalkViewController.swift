//
//  KakaoTalkViewController.swift
//  newlyWordProject
//
//  Created by 염성필 on 2023/07/22.
//

import UIKit

class KakaoTalkViewController: UIViewController {

    @IBOutlet var closeButton: UIButton!
    
    @IBOutlet var bgImage: UIImageView!
    @IBOutlet var variousButton: [UIButton]!
    
    @IBOutlet var myImageBtn: UIButton!
    @IBOutlet var myNickBtn: UIButton!
    
    @IBOutlet var menuBtnCollection: [UIButton]!
    
   
    @IBOutlet var menuLabel: [UIButton]!
    
    let menuImage: [String] = [
    "message.fill",
    "pencil",
    "doc.append.fill.rtl"
    ]
    
    let menuText: [String] = [
    "나와의 채팅",
    "프로필 편집",
    "카카오스토리"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBg()
        settingTopAreaButton()
        myImageInfo()
        settingMenuButton()
        
       
    }
    
    func configureBg() {
        bgImage.image = UIImage(named: "bgImage")
        bgImage.contentMode = .scaleToFill
    }
    
    func settingTopAreaButton() {
        closeButton.tintColorSetting()
        
        for button in variousButton {
            button.tintColorSetting()
        }
    }
    
    func myImageInfo() {
        
       // 스토리보드를 통해 Style을 default로 변경
        myImageBtn.setTitle("", for: .normal)
        myImageBtn.setImage(UIImage(named: "myImage"), for: .normal)
        myImageBtn.layer.cornerRadius = 30
        myImageBtn.backgroundColor = .red
        myImageBtn.clipsToBounds = true
        
        myNickBtn.setTitle("염성필", for: .normal)
        myNickBtn.tintColor = .white
        myNickBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }
    
    func settingMenuButton() {
        
        // Configure 사용해서 UIButton systemImage size 조절
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .bold, scale: .large)
  
        // 스토리보드를 통해 Style을 default로 변경
        for index in 0..<menuBtnCollection.count {
            
            let largeBoldDoc = UIImage(systemName: menuImage[index], withConfiguration: largeConfig)

            
            menuBtnCollection[index].setTitle("", for: .normal)
//            menuBtnCollection[index].setImage(UIImage(systemName: menuImage[index]), for: .normal)
//
            menuBtnCollection[index].setImage(largeBoldDoc, for: .normal)
            menuBtnCollection[index].tintColorSetting()
            menuBtnCollection[index].contentMode = .scaleAspectFill
        
            menuLabel[index].setTitle(menuText[index], for: .normal)
            menuLabel[index].titleLabel?.font = UIFont.systemFont(ofSize: 12)
            menuLabel[index].tintColorSetting()
        }
    }
}

extension UIButton {
    func tintColorSetting() {
        self.tintColor = .white
    }
}
