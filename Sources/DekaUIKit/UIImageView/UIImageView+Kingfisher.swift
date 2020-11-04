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
    
    public func setImage(with string: String?,
                         placeholder: UIImage? = nil,
                         resize: Bool = true,
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
        if resize {
            let scale = UIScreen.main.scale
            let referenceSize = CGSize(width: frame.width * scale, height: frame.height * scale)
            let resizingImageProcessor = ResizingImageProcessor(referenceSize: referenceSize,
                                                                mode: .aspectFit)
            options.append(.processor(resizingImageProcessor))
        }
        
        kf.setImage(with: url, placeholder: placeholder, options: options, completionHandler:  { result in
            completion()
        })
    }
}
