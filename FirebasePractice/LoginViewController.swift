import UIKit
import Firebase

class LoginViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func login(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
                if let _ = user {
              self.dismiss
            }
        }
        
    }
}
