//
//  BaeMinViewController.swift
//  newlyWordProject
//
//  Created by 염성필 on 2023/07/22.
//

import UIKit

class BaeMinViewController: UIViewController {
    
    @IBOutlet var inputTextField: UITextField!
    
    @IBOutlet var menuButton: [UIBarButtonItem]!
    
    @IBOutlet var searchBgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBgviewApplyCorner()
        settingButton()
    }
    
    func searchBgviewApplyCorner() {
        let path = UIBezierPath(roundedRect:searchBgView.bounds,
                                byRoundingCorners:[.bottomRight, .bottomLeft],
                                cornerRadii: CGSize(width: 20, height:  20))

        let maskLayer = CAShapeLayer()

        maskLayer.path = path.cgPath
        searchBgView.layer.mask = maskLayer
    }
   
    func settingButton() {
        for barButton in menuButton {
            barButton.tintColor = .white
        }
    }
    
}
