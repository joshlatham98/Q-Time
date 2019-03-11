import UIKit
import Firebase


class AppManager {
    static let shared = AppManager()
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    private init() { }
    
    
    var appContainer: AppContainerViewController!
    
    func showApp() {
        var viewController: UIViewController
        if Auth.auth().currentUser == nil {
            viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        } else {
            viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        }
        appContainer.present(viewController, animated: true, completion: nil)
    }
    
    func logout() {
        try! Auth.auth().signOut()
        appContainer.presentedViewController?.dismiss(animated: true, completion: nil)
    }
}
