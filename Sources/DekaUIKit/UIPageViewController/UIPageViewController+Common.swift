import UIKit

extension UIPageViewController {
    public func removeBounces() {
        for subview in view.subviews {
            if let scrollView = subview as? UIScrollView {
                scrollView.bounces = false
                break;
            }
        }
    }
}
