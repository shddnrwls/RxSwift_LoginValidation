 //
//  LoginViewModel.swift
//  Rxswift_Login
//
//  Created by mac on 2018. 8. 5..
//  Copyright © 2018년 UkJin. All rights reserved.
//

import Foundation
import RxSwift

 struct LoginViewModel {
    var emailText = Variable<String>("")
    var passwordText = Variable<String>("")
    
    var isValid: Observable<Bool>{
        return Observable.combineLatest(emailText.asObservable(),passwordText.asObservable()){ email, password in
            email.characters.count >= 3 && password.characters.count >= 3
            
        }
    }
 }
