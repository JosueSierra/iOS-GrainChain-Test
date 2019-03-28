//
//  RegisterController.swift
//  iOS GrainChain Test
//
//  Created by Sokolabs on 3/28/19.
//  Copyright © 2019 roho. All rights reserved.
//

import UIKit

class RegisterController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var constBottomButton: NSLayoutConstraint!
    @IBOutlet weak var btnAddUser: UIButton!
    @IBOutlet weak var imgPhoto: UIView!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtLastname: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        propertiesField()
        gestureRecognizer()
    }
    
    func gestureRecognizer(){
        let tapView = UITapGestureRecognizer.init(target: self, action: #selector(tapView(_:)))
        self.view.addGestureRecognizer(tapView)
    }
    
    @objc func tapView(_ sender: UIGestureRecognizer){
        self.view.endEditing(true)
    }
    
    func propertiesField(){
        txtName.layer.borderWidth = 1.1
        txtName.layer.borderColor = #colorLiteral(red: 0.4823529412, green: 0.7568627451, blue: 0.3294117647, alpha: 1)
        txtLastname.layer.borderWidth = 1.1
        txtLastname.layer.borderColor = #colorLiteral(red: 0.4823529412, green: 0.7568627451, blue: 0.3294117647, alpha: 1)
        txtAge.layer.borderWidth = 1.1
        txtAge.layer.borderColor = #colorLiteral(red: 0.4823529412, green: 0.7568627451, blue: 0.3294117647, alpha: 1)
        txtPhone.layer.borderWidth = 1.1
        txtPhone.layer.borderColor = #colorLiteral(red: 0.4823529412, green: 0.7568627451, blue: 0.3294117647, alpha: 1)
        imgPhoto.layer.masksToBounds = true
        imgPhoto.layer.cornerRadius = imgPhoto.frame.width / 2
        imgPhoto.layer.borderWidth = 1.1
        imgPhoto.layer.borderColor = #colorLiteral(red: 0.4823529412, green: 0.7568627451, blue: 0.3294117647, alpha: 1)
    }
    
    @IBAction func btnAddUser(_ sender: Any) {
    }
}
