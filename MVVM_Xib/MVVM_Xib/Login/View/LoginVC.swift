//
//  LoginVC.swift
//  MVVM_Xib
//
//  Created by Bassant on 13/08/2023.
//

import UIKit

class LoginVC: NibViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var birthdate: UIDatePicker!
    
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LoginViewModel()
    }

    @IBAction func next(_ sender: Any) {
        viewModel.validate(username: username, birthdate: birthdate)
        viewModel.valid.bind { val in
            if val == true{
                let vc = HomeVC()
                vc.name = self.username.text
        
                let ageComponents = Calendar.current.dateComponents([.year], from: self.birthdate.date, to: Date())
                vc.age = ageComponents.year
        
                self.present(vc, animated: true)
        }
            else{
                // alert
                let alert = self.viewModel.alert()
                self.present(alert, animated: true)
            }
        }
    }
}
