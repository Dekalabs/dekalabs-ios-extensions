import Foundation

extension String {
    public func toDictionary(encoding: Encoding = .utf8) -> [String: Any]? {
        if let data = self.data(using: encoding) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
