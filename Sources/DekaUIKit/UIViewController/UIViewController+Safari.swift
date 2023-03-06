import UIKit
import SafariServices
import os.log

extension UIViewController {
    public func openSafari(url: String) {
        guard var urlValid = URL(string: url) else {
            os_log(.default, "No valid URL: %@", url)
            return
        }
        
        if !(["http", "https"].contains(urlValid.scheme?.lowercased())) {
            let appendedLink = "http://".appending(url)
            
            if let urlValidWithHTTP = URL(string: appendedLink) {
                urlValid = urlValidWithHTTP
            } else {
                os_log(.default, "No valid URL: %@", appendedLink)
                return
            }
        }
        
        let vc = SFSafariViewController(url: urlValid)
        present(vc, animated: true, completion: nil)
        os_log(.info, "Safari open URL: %@", urlValid.absoluteString)
    }
}
