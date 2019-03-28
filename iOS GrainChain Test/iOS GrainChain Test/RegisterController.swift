//
//  RegisterController.swift
//  iOS GrainChain Test
//
//  Created by Sokolabs on 3/28/19.
//  Copyright © 2019 roho. All rights reserved.
//

import UIKit
import Foundation

class RegisterController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imgCamera: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var nabItemAddUser: UINavigationItem!
    @IBOutlet weak var constBottomButton: NSLayoutConstraint!
    @IBOutlet weak var btnAddUser: UIButton!
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtLastname: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    var nameUser = String()
    let userDefaults = UserDefaults.standard
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        propertiesField()
        gestureRecognizer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        nameUser = userDefaults.string(forKey: "name")!
        print(userDefaults.string(forKey: "name")!)
        lblTitle.text! = nameUser
        txtName.delegate = self
        txtLastname.delegate = self
        txtAge.delegate = self
        txtPhone.delegate = self
    }
    
    func gestureRecognizer(){
        let tapView = UITapGestureRecognizer.init(target: self, action: #selector(tapView(_:)))
        self.view.addGestureRecognizer(tapView)
        let tapCamera = UITapGestureRecognizer.init(target: self, action: #selector(changeImage(_:)))
        self.imgCamera.addGestureRecognizer(tapCamera)
    }
    
    @objc func tapView(_ sender: UIGestureRecognizer){
        self.view.endEditing(true)
    }
    
    @objc func changeImage(_ sender: UIGestureRecognizer){
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage =  info["\(UIImagePickerController.InfoKey.originalImage)"] as? UIImage
        imgPhoto.image = chosenImage
        imagePicker.dismiss(animated: true, completion: nil)
        
        imgPhoto.isHidden = false
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
        if validate(){
            alertMessage("Error", "Todos los campos son requeridos")
            
            return
        }
        insertUser()
        alertMessage("Exitoso", "Contacto agregado correctamente")
        resetValues()
    }
    
    func validate()->Bool{
        return txtName.text!.isEmpty || txtLastname.text!.isEmpty || txtAge.text!.isEmpty || txtPhone.text!.isEmpty
    }
    
    func alertMessage(_ title:String, _ message: String){
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func insertUser(){
        ContactsInfo.instance.arrayName.append(txtName.text!)
        ContactsInfo.instance.arrayLastName.append(txtLastname.text!)
        ContactsInfo.instance.arrayAge.append((txtAge.text as! NSString).integerValue)
        ContactsInfo.instance.arrayPhone.append(txtPhone.text!)
        UserDefaultsInfo.instance.saveInfo()
    }
    
    func resetValues(){
        txtName.text = ""
        txtLastname.text = ""
        txtAge.text = ""
        txtPhone.text = ""

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtName{
            txtLastname.becomeFirstResponder()
            return true
        }
        if textField == txtLastname{
            txtAge.becomeFirstResponder()
            return true
        }
        if textField == txtAge{
            txtPhone.becomeFirstResponder()
            return true
        }
        return false
    }
}
