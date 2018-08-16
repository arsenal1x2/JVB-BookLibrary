//
//  LoginViewController.swift
//  JVB-BookLibrary
//
//  Created by Admin on 8/2/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Alamofire
class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    private var checkboxIsChecked:Bool!
    var container:UIView!
    var actInd:UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkboxIsChecked = false
        underlineTitleButton(button: forgotPasswordButton)
        boderButton(button: loginButton)
        setupActivityIndicatory(uiView: self.view)

        // Do any additional setup after loading the view.
    }
    func underlineTitleButton(button:UIButton){
        let attrs = [
            NSAttributedStringKey.font : UIFont.init(name: "Futura", size: 15.0)!,
            NSAttributedStringKey.foregroundColor : UIColor.init(hex: "0404B4"),
            NSAttributedStringKey.underlineStyle : 1] as [NSAttributedStringKey : Any]
        
        let attributedString = NSMutableAttributedString(string:"")
        let buttonTitleStr = NSMutableAttributedString(string:"Forgot password", attributes:attrs)
        attributedString.append(buttonTitleStr)
        button.setAttributedTitle(attributedString, for: .normal)
    }
    func boderButton(button:UIButton){
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickButtonLogin(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        let loginForm = LoginForm(username: username, password: password)
        let result = login(with: loginForm)
        container.isHidden = false
        actInd.startAnimating()
        if (result.success == true) {
            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(homeViewController, animated: true)
            actInd.stopAnimating()
        }else{
            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(homeViewController, animated: true)
            actInd.stopAnimating()
        }
        
    }
    func setupActivityIndicatory(uiView: UIView) {
        container = UIView()
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColor(hex: "0xffffff").withAlphaComponent(0.3)
        
        let loadingView: UIView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor(hex: "0x444444").withAlphaComponent(0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        actInd = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        actInd.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
        actInd.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        loadingView.addSubview(actInd)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        container.isHidden = true
        
    }
    
    @IBAction func clickCheckboxButton(_ sender: Any) {
        changeStateCheckBoxButton(checked: checkboxIsChecked)
    }
    func changeStateCheckBoxButton(checked:Bool) {
        if(checked){
            if let image = UIImage(named: "icons8-unchecked-checkbox-filled") {
                checkboxButton.setImage(image, for: .normal)
                checkboxIsChecked = false
            }
        }else{
            if let image = UIImage(named: "icons8-tick-box") {
                checkboxButton.setImage(image, for: .normal)
                checkboxIsChecked = true
            }
        }
    }
    @IBAction func clickForgotPasswordButton(_ sender: Any) {
    }
    func login(with loginForm:LoginForm) -> (success:Bool,message:String) {
        let parameters = [
            "username": "admin",
            "password": "admin"
        ]
        
        Alamofire.request(Constant.API.LOGIN, method:.post, parameters:parameters,encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
              //  print(response.value)
                let dict = response.value! as? NSDictionary
                
                let user = User(data: dict)
                print(user!.name)
            case .failure(let _):
                print("error")
                
            }
        }
        return (true,"login success")
    }
    
}
