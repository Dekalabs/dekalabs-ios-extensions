//
//  File.swift
//  
//
//  Created by Ginés Navarro Fernández on 10/11/2020.
//

import UIKit

extension String {
    
    func generateQRCode(scale: CGFloat = 8) -> UIImage? {
        guard let data = self.data(using: String.Encoding.ascii) else {
            return nil
        }
        guard let filter = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data]) else {
            return nil
        }
        
        let transform = CGAffineTransform(scaleX: scale, y: scale)
        
        if let output = filter.outputImage?.transformed(by: transform) {
            return UIImage(ciImage: output)
        }
        
        return nil
    }

    func generate128Code(scale: CGFloat = 8) -> UIImage? {
        guard let data = self.data(using: String.Encoding.ascii) else {
            return nil
        }
        guard let filter = CIFilter(name: "CICode128BarcodeGenerator", parameters: ["inputMessage": data]) else {
            return nil
        }
        
        let transform = CGAffineTransform(scaleX: scale, y: scale)

        if let output = filter.outputImage?.transformed(by: transform) {
            return UIImage(ciImage: output)
        }
        
        return nil
    }
    
}
