//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Berkay Kuzu on 25.08.2022.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        let authcontext = LAContext() // authentication(doğrulama) için kullanılan bir obje.
        
        var error: NSError?
    
        if authcontext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            //NSPointer haline getirmek için & koyduk.
            
            authcontext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { success, error in
                if success == true {
                    DispatchQueue.main.sync {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                } else {
                    DispatchQueue.main.sync {
                        self.myLabel.text = "Error!"
                    }
                }
            }
        }
    }
}

