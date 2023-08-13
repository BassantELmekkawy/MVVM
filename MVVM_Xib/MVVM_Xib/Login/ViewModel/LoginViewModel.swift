//
//  LoginViewModel.swift
//  MVVM_Xib
//
//  Created by Bassant on 13/08/2023.
//

import Foundation
import UIKit

class LoginViewModel{
    
    var valid = Observable(false)
    
    func validate (username: UITextField, birthdate: UIDatePicker) -> Void{
        birthdate.maximumDate = Calendar.current.date(byAdding: .year, value: -10, to: Date())!;
        birthdate.minimumDate = Calendar.current.date(byAdding: .year, value: -100, to: Date())!;
        
        if let name = username.text?.trimmingCharacters(in: .whitespacesAndNewlines),
           !name.isEmpty, !Calendar.current.isDate(birthdate.date, inSameDayAs: Date()), birthdate.date > birthdate.minimumDate!,
           birthdate.date < birthdate.maximumDate! {
            valid.value = true
        }
        else{
            valid.value = false
        }
    }
    
    func alert() -> UIAlertController{
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let attributedString = NSAttributedString(string: "please fill in required fields", attributes: [
            .font: UIFont.systemFont(ofSize: 20)
        ])
        alert.setValue(attributedString, forKey: "attributedMessage")
        alert.view.tintColor = UIColor.black

        let cancelAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel)
        alert.addAction(cancelAction)
        return alert
    }
}
