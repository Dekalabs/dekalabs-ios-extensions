import UIKit

extension UIStackView {
    @IBInspectable
    public var stackBackgroundColor: UIColor? {
        get {
            if subviews.isEmpty {
                return nil
            }
            return subviews[0].backgroundColor
        }
        set {
            if subviews.isEmpty {
                let subView = UIView(frame: bounds)
                subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                insertSubview(subView, at: 0)
            }
            subviews[0].backgroundColor = newValue
        }
    }
    
    @IBInspectable
    public var stackCornerRadius: CGFloat {
        get {
            if subviews.isEmpty {
                return 0
            }
            return subviews[0].layer.cornerRadius
        }
        set {
            if subviews.isEmpty {
                let subView = UIView(frame: bounds)
                subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                insertSubview(subView, at: 0)
            }
            subviews[0].layer.cornerRadius = newValue
        }
    }
}
