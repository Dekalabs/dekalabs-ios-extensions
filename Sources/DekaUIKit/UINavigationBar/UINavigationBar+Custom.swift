import UIKit

extension UINavigationBar {
    public func setClear() {
        backgroundColor = .clear
        setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        shadowImage = UIImage()
        isTranslucent = true
    }
}
