//
//  ViewController.swift
//  newlyWordProject
//
//  Created by 염성필 on 2023/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var searchStackView: UIStackView!
    @IBOutlet var searchButton: UIButton!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var mainStackView: UIStackView!
    
    @IBOutlet var nextlayoutPraticeBtn: UIButton!
    
    @IBOutlet var buttonNameCollection: [UIButton]!
    
    let newlyWordDictionary: [String:String] = [
        "상남자": "남자다운 모습을 가지고 있는 남자",
        "신박하다": "새롭고 놀랍다",
        "갓생": "열심히 사는 인생",
        "항마력": "정신석 내성, 대항력, 평점심을 말함"
    ]
    
    var keyNameArray: [String] = []
    
    var resultLabel: String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print("123")
        print("이부분")
        settingButtonName()
        settingSearchTextField()
        settingMainText()
    }
    
    
    func settingSearchTextField() {
        searchStackView.layer.borderWidth = 1
        searchStackView.layer.borderColor = UIColor.black.cgColor
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
    }
    
    func settingButtonName() {
        print(#function)
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = UIColor.gray
        config.cornerStyle = .capsule
        config.buttonSize = .small
        
        nextlayoutPraticeBtn.setTitle("레이아웃 연습하기", for: .normal)
        // Dictionary에서 key빼서 배열을 만든다. -> for문이 돌아갈때 순서있게 이름을 넣어주기 위함
        keyNameArray = newlyWordDictionary.map { $0.key }
        
        // button에 setTitle 속성을 사용해서 이름을 부여 한다.
        for index in 0..<buttonNameCollection.count {
            buttonNameCollection[index].setTitle(keyNameArray[index], for: .normal)
            buttonNameCollection[index].configuration = config
        }
        
    }
    
   
    func settingMainText() {
        titleLabel.text = "설명"
        titleLabel.layer.borderColor = UIColor.blue.cgColor
        titleLabel.layer.borderWidth = 1
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        
        descriptionLabel.text = "재밌는 신조어 검색해보기"
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        
        mainStackView.layer.borderWidth = 1
        mainStackView.layer.borderColor = UIColor.blue.cgColor
        
    }
    
    @IBAction func inputTextFieldReturnClicked(_ sender: UITextField) {
        
        searchNewWordDescription(newWord: inputTextField.text)

    }
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        searchNewWordDescription(newWord: inputTextField.text)
    }
    
    @IBAction func newlyWordButtonClicked(_ sender: UIButton) {
        
        inputTextField.text = sender.titleLabel?.text
       
    }
    
    func searchNewWordDescription(newWord: String? = "잘못된 값") {
        for (key,value) in newlyWordDictionary {
            if key == inputTextField.text {
                print("value",value)
                resultLabel = value
            }
        }
        
        descriptionLabel.text = resultLabel
    }
    
}

