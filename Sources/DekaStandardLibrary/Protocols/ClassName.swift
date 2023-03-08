import Foundation

public protocol ClassName {
    static var className: String { get }
}

public extension ClassName {
    static var className: String {
        let name = String(describing: self)
        return name
    }
}
