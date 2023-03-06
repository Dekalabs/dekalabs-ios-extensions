import UIKit

extension UIImage {
    public func toBase64(compressionQuality: CGFloat = CGFloat(0.85)) -> String? {
        let imageData = self.jpegData(compressionQuality: compressionQuality)
        let base64String = imageData?.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
        
        return base64String
    }
    
    public func toData(compressionQuality: CGFloat = CGFloat(0.85)) -> Data? {
        return self.jpegData(compressionQuality: compressionQuality)
    }
}
