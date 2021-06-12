//
//  Auth.swift
//  AuthTest
//
//  Created by Илья Груздев on 11.06.2021.
//

import Foundation

class LoginViewModel: ObservableObject {
    var email = ""
    var password = ""
    
    func login() {
        
        let defaults = UserDefaults.standard
        
        NetworkService().login(email: email, password: password) { result in
            switch result {
            case .success(let token):
                defaults.setValue(token, forKey: "jsonwebtoken")
                DispatchQueue.main.async {
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                }
                    
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logout() {
           
           let defaults = UserDefaults.standard
           defaults.removeObject(forKey: "jsonwebtoken")
           DispatchQueue.main.async {
            UserDefaults.standard.set(false, forKey: "status")
            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
           }
    }
}
