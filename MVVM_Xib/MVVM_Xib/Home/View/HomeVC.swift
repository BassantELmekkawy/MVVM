//
//  HomeVC.swift
//  MVVM_Xib
//
//  Created by Bassant on 13/08/2023.
//

import UIKit

class HomeVC: NibViewController {
    
    var name: String? = ""
    var age: Int?
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.text = name
        userAge.text = "\(age ?? 0) "

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
