import Foundation

extension String {
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }

    func localized(with args: CVarArg...) -> String {
        return String(format: self.localized(), arguments: args)
    }
}
