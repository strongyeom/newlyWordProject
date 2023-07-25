//
//  ViewController.swift
//  newlyWordProject
//
//  Created by 염성필 on 2023/07/21.
//

import UIKit

// Todo
// 1. 띄어쓰기 whitespace 적용해보기 ✅
// 2. 워딩들 Enum으로 만들어보기 ✅

class ViewController: UIViewController {
    
    enum NewWord {
        case success
        case none
    }
    
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var searchStackView: UIStackView!
    @IBOutlet var searchButton: UIButton!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var mainStackView: UIStackView!
    
    @IBOutlet var nextlayoutPraticeBtn: UIButton!
    
    @IBOutlet var buttonNameCollection: [UIButton]!
    
    var newlyWordDictionary: [String:String] = [
        "상남자": "남자다운 모습을 가지고 있는 남자",
        "신박하다": "새롭고 놀랍다",
        "갓생": "열심히 사는 인생",
        "항마력": "정신석 내성, 대항력, 평점심을 말함"
    ]
    
   // var keyNameArray: [String] = []
    lazy var keyNameArray: [String] = newlyWordDictionary.map { $0.key }
    
    var resultLabel: String = ""
    
    var isNewWord: NewWord = .success
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingButtonName()
        settingSearchStackView()
        settingMainText()
    }
    
    
    func settingSearchStackView() {
        searchStackView.layer.borderWidth = 1
        searchStackView.layer.borderColor = UIColor.black.cgColor
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
        inputTextField.autocapitalizationType = .none
        inputTextField.autocorrectionType = .no
        inputTextField.placeholder = "신조어를 입력해주세요."
        
    }
    
    func settingButtonName() {
        print(#function)
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = UIColor.gray
        config.cornerStyle = .capsule
        config.buttonSize = .small
        
        nextlayoutPraticeBtn.setTitle("레이아웃 연습하기", for: .normal)
        // Dictionary에서 key빼서 배열을 만든다. -> for문이 돌아갈때 순서있게 이름을 넣어주기 위함
         // keyNameArray = newlyWordDictionary.map { $0.key }
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
        
       
        
        guard let text = inputTextField.text else { return }
        let whiteText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        
        print("text",whiteText)
        if whiteText.count < 1 {
            let alert = UIAlertController(title: "경고", message: "텍스트에 띄어쓰기 또는 한글자만 입력되었습니다.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
            inputTextField.text = ""
        } else {
            searchNewWordDescription(newWord: inputTextField.text)
        }

    }
    
    @IBAction func searchButtonClicked(_ sender: UIButton) {
        searchNewWordDescription(newWord: inputTextField.text)
        print("keyNameArray",keyNameArray)
    }
    
    @IBAction func newlyWordButtonClicked(_ sender: UIButton) {
        
        guard let textFieldText = sender.titleLabel else { return }
        inputTextField.text = textFieldText.text
       
    }
    
    func searchNewWordDescription(newWord: String? = "잘못된 값") {
        for (key,value) in newlyWordDictionary {
            if key == inputTextField.text {
                print("value",value)
                resultLabel = value
            }
        }
        
        if !keyNameArray.contains(inputTextField.text ?? "0") {
            resultLabel = "찾을 수 없습니다."
            isNewWord = .none
        }
        
        //  알럿을 통해 새로운 키워드 등록하기
        if isNewWord == .none {
            let alert = UIAlertController(title: "신조어 등록하기", message: "신조어와 내용을 적어주세요", preferredStyle: .alert)
        
            alert.addTextField { text in
                text.placeholder = "신조어"
            }
            alert.addTextField { text in
                text.placeholder = "내용을 입력해주세요"
            }
            
            let ok = UIAlertAction(title: "확인", style: .default) { _ in
                let newWord = alert.textFields?[0].text
                let newWordDescription = alert.textFields?[1].text
                
                guard let newWordDescription = newWordDescription,
                      let newWord = newWord else { return }
                
                
                
                
                self.newlyWordDictionary.updateValue(newWordDescription, forKey: newWord)
                self.inputTextField.text = ""
                self.descriptionLabel.text = ""
                self.keyNameArray.append(newWord)
                print("newlyWordDictionary",self.newlyWordDictionary)
            }
            let cancel = UIAlertAction(title: "취소", style: .destructive) { _ in
                self.inputTextField.text = ""
                self.descriptionLabel.text = ""
            }
            
            
            alert.addAction(ok)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
        
        isNewWord = .success
        descriptionLabel.text = resultLabel
    }
    
}

