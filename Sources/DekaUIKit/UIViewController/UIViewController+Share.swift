//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 03/11/2020.
//

import UIKit
import MessageUI

extension UIViewController {
    
    public func shareWithMail(to email: String,
                              subject: String? = nil,
                              body: String? = nil) -> MFMailComposeViewController? {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.setToRecipients([email])
            if let subject = subject {
                mail.setSubject(subject)
            }
            if let body = body {
                mail.setMessageBody(body, isHTML: false)
            }
            
            present(mail, animated: true)
            return mail
        } else {
            showAlert(message: NSLocalizedString("ALERT_NO_MAIL_SERVICE_MESSAGE", comment: ""),
                      title: NSLocalizedString("ALERT_NO_MAIL_SERVICE_TITLE", comment: ""))
            return nil
        }
    }
}
