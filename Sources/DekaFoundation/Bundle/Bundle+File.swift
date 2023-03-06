import Foundation

public extension Bundle {
    func loadDataFromFile(_ file: String) -> Data? {
        guard let url = url(forResource: file, withExtension: nil) else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
}
