//
//  ViewController.swift
//  Rxswift_Login
//
//  Created by mac on 2018. 8. 5..
//  Copyright © 2018년 UkJin. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


class ViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var stateLbl: UILabel!
    
    
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = emailTextField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.emailText)
        _ = passwordTextField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.passwordText)
        _ = loginViewModel.isValid.bind(to: loginBtn.rx.isEnabled)
        _ = loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            self.stateLbl.text = isValid ? "Enabled" : "NotEnabled"
            self.stateLbl.textColor = isValid ? .green : .red
        }).disposed(by: disposeBag)
    }

}

