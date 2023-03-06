import UIKit

extension UIView {
    public func addSubviewOccupingWholeSpace(view: UIView, to topLayoutGuide: UILayoutSupport) {
        if view.superview == self {
            view.removeFromSuperview()
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let topConstraint = NSLayoutConstraint(item: topLayoutGuide, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let constraints = [topConstraint, leadingConstraint, trailingConstraint, bottomConstraint]
        addConstraints(constraints)
    }
    
    public func addSubviewOccupingWholeSpace(view: UIView) {
        if view.superview == self {
            view.removeFromSuperview()
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let topConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)
        let constraints = [topConstraint, leadingConstraint, trailingConstraint, bottomConstraint]
        addConstraints(constraints)
    }
}

extension UIView {
    public func anchorsConstraint(to view: UIView, edgeInsets: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        return [
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: edgeInsets.left),
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -edgeInsets.right),
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: edgeInsets.top),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -edgeInsets.bottom)
        ]
    }
}

protocol LayoutConstraintsWrapper {
    var constraints: [NSLayoutConstraint] { get }
}

extension Array: LayoutConstraintsWrapper where Element: NSLayoutConstraint {
    public var constraints: [NSLayoutConstraint] {
        return self
    }
}

extension NSLayoutConstraint: LayoutConstraintsWrapper {
    var constraints: [NSLayoutConstraint] {
        return [self]
    }
}

extension NSLayoutConstraint {
    class func activate(_ constraints: [LayoutConstraintsWrapper]) {
        activate(constraints.flatMap { $0.constraints })
    }
}
