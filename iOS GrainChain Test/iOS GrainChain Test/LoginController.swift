//
//  ViewController.swift
//  iOS GrainChain Test
//
//  Created by Sokolabs on 3/27/19.
//  Copyright © 2019 roho. All rights reserved.
//

import UIKit
import Alamofire

class LoginController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var viewImageUsername: UIView!
    @IBOutlet weak var viewImagePassword: UIView!
    @IBOutlet weak var viewUsername: UIView!
    @IBOutlet weak var viewPassword: UIView!
    
    let baseUrl = "https://kdmldkvxoe.execute-api.us-west-2.amazonaws.com/test"
    var alert =  UIAlertController()
    var statusCode = Int()
    var nameUser = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        propertiesIcons()
        gestureRecognizer()
    }
    
    func propertiesIcons(){
        viewImagePassword.layer.borderWidth = 2
        viewImagePassword.layer.borderColor = #colorLiteral(red: 0.4823529412, green: 0.7568627451, blue: 0.3294117647, alpha: 1)
        viewImageUsername.layer.borderWidth = 2
        viewImageUsername.layer.borderColor = #colorLiteral(red: 0.4823529412, green: 0.7568627451, blue: 0.3294117647, alpha: 1)
        viewUsername.layer.borderWidth = 2
        viewUsername.layer.borderColor = #colorLiteral(red: 0.4823529412, green: 0.7568627451, blue: 0.3294117647, alpha: 1)
        viewPassword.layer.borderWidth = 2
        viewPassword.layer.borderColor = #colorLiteral(red: 0.4823529412, green: 0.7568627451, blue: 0.3294117647, alpha: 1)
    }
    
    func gestureRecognizer(){
        let tapView = UITapGestureRecognizer.init(target: self, action: #selector(tapView(_:)))
        self.view.addGestureRecognizer(tapView)
    }
    
    @objc func tapView(_ sender: UIGestureRecognizer){
        self.view.endEditing(true)
    }
    
    func alertLoading(){
        alert = UIAlertController(title: nil, message: "Cargando", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func alertMessage(_ title:String, _ message: String){
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func login(){
        alertLoading()
        let parameters = ["username": txtUsername.text!,
                          "password": txtPassword.text!]
        Alamofire.request(baseUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            self.alert.dismiss(animated: true, completion: nil)
            let data = response.result.value
            let errorMessage = ((data as! [String:Any])["errorMessage"])
            if errorMessage == nil {
                self.statusCode = (data as! NSDictionary).value(forKey: "statusCode") as! Int
            }
            switch response.result{
            case.success:
                if self.statusCode == 200 {
                    let body = (((data as! NSDictionary).value(forKey: "body") as! NSDictionary).value(forKey: "auth") as! NSDictionary).value(forKey: "user") as! NSDictionary
                    let name = body.value(forKey: "name")
                    let lastName = body.value(forKey: "lastname")
                    self.nameUser = "\(name!) \(lastName!)"
                    print(self.nameUser)
                    self.performSegue(withIdentifier: "segueLogin", sender: nil)
                }else{
                    self.alertMessage("Error", "Error en tu usuario y/o contraseña")
                }
            case .failure(let error):
                self.alertMessage("Error", "\(error)")
            }
        }
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        if !Connectivity.instance.isConnectedToInternet(){
            alertMessage("Error de Conexión", "Asegurese de estar conectado a una red")
            return
        }
        login()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination
    }
    
}

