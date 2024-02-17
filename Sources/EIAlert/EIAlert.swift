
import UIKit

public class EIAlert {
    public static let shared = EIAlert()
    private init() {}
    
    public let rootViewController = UIApplication.shared.firstKeyWindow?.rootViewController
}


public extension EIAlert {
    func showAlertWith(title: String, message: String, buttonTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithCompletionAndCancel(title: String, message: String, buttonTitle: String, cancelTitle: String = "Cancel", completion: @escaping ()->Void ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .destructive) { (_) in
            completion()
        }
        let cancel = UIAlertAction(title: cancelTitle, style: .cancel)
        
        alert.addAction(action)
        alert.addAction(cancel)
        rootViewController?.present(alert, animated: true, completion: nil)
    }
}
