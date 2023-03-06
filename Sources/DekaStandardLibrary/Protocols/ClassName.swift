import Foundation

protocol ClassName {
    static var className: String { get }
}

extension ClassName {
    static var className: String {
        let name = String(describing: self)
        return name
    }
}
