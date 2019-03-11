

import UIKit
import Firebase

class SignupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    
    let picker = UIImagePickerController()
    //var userStorage: DatabaseReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        
       // _ = userStorage.database

    }
    
    @IBAction func selectImagePressed(_ sender: Any) {
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageView.image = image
            nextBtn.isHidden = false
        }
        self.dismiss(animated: true, completion: nil)
        
        
        
        
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        guard nameField.text != "", emailField.text != "", passwordField.text != "", confirmPasswordField.text != "" else { return}
        
        if passwordField.text == confirmPasswordField.text {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: {(user, error) in
                
                if let error = error {
                    print(error.localizedDescription)
                }
                
                if user != nil {
                    
                }
            })
            
        }else{
            print("Password does not match")
        }
        
        
        
    }
    
    
}

