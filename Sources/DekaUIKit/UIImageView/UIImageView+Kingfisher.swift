//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 03/11/2020.
//

import UIKit
import Kingfisher
import os.log

extension UIImageView {
    
    func setImage(with string: String?,
                  placeholder: UIImage? = nil,
                  referenceSize: CGSize = CGSize(width: UIScreen.main.bounds.width * UIScreen.main.scale,
                                                 height: UIScreen.main.bounds.height * UIScreen.main.scale),
                  completion: @escaping () -> Void = {}) {
        guard let string = string else {
            if let i = placeholder { image = i }
            completion()
            return
        }
        
        guard let url = URL(string: string) else {
            os_log(.default, "No valid URL: %@", string)
            if let i = placeholder { image = i }
            completion()
            return
        }
        
        var options = KingfisherOptionsInfo()
        let resizingImageProcessor = ResizingImageProcessor(referenceSize: referenceSize,
                                                            mode: .aspectFit)
        options.append(.processor(resizingImageProcessor))
        
        kf.setImage(with: url, placeholder: placeholder, options: options, completionHandler:  { result in
            completion()
        })
    }
}
