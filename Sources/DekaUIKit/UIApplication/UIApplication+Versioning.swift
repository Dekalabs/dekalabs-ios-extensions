import UIKit

extension UIApplication {
    public static var versionNumber: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
    }
    
    public static var buildVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
    }
    
    public static func isForceVersion(minVersion: String) -> Bool {
        let versionCompare = versionNumber.compare(minVersion, options: .numeric)
        if versionCompare == .orderedAscending {
            return true
        } else {
            return false
        }
    }
}
